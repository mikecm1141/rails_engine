require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'Relationships' do
    it { should have_many :items }
    it { should have_many :invoices }
    it { should have_many(:invoice_items).through(:invoices) }
  end

  describe 'Instance Methods' do
    before(:each) do
      @merchant = create(:merchant)
      @date = '2018-09-02 00:00:00 UTC'
      @customer1, @customer2 = create_list(:customer, 2)

      invoice1 = create(:invoice, merchant: @merchant, customer: @customer1)
      create_list(:invoice_item, 2, invoice: invoice1, unit_price: 10.5, quantity: 2)
      create(:transaction, invoice: invoice1, result: 'success')

      invoice2 = create(:invoice, merchant: @merchant)
      create_list(:invoice_item, 2, invoice: invoice2, unit_price: 12.25, quantity: 1)
      create(:transaction, invoice: invoice2, result: 'failed')

      invoice3 = create(:invoice, merchant: @merchant, customer: @customer1, updated_at: @date)
      create_list(:invoice_item, 3, invoice: invoice3, unit_price: 15.25, quantity: 2)
      create(:transaction, invoice: invoice3, result: 'success')

      invoice4 = create(:invoice, merchant: @merchant, customer: @customer2)
      create_list(:invoice_item, 2, invoice: invoice4, unit_price: 12.20, quantity: 1)
      create(:transaction, invoice: invoice4, result: 'success')
    end
    context 'Business Logic Methods' do
      it '#total_revenue' do
        expect(@merchant.total_revenue.to_f).to eq(157.9)
      end

      it '#total_revenue(date)' do
        parameter = {
          invoices: { updated_at: @date.to_date.beginning_of_day..@date.to_date.end_of_day }
        }

        expect(@merchant.total_revenue(parameter).to_f).to eq(91.5)
      end

      it '#favorite_customer' do
        expect(@merchant.favorite_customer.id).to eq(@customer1.id)
      end
    end
  end

  describe 'Class Methods' do
    context 'Finder Methods' do
      it '.random' do
        m1, m2, m3 = create_list(:merchant, 3)

        expect(Merchant.random).to be_a(Merchant)
      end
    end

    context 'Business Logic Methods' do
      before(:each) do
      @merchant1, @merchant2, @merchant3, @merchant4 = create_list(:merchant, 4)

      # Merchant 1 Sales Data
      invoice1 = create(:invoice, merchant: @merchant1)
      create_list(:invoice_item, 3, invoice: invoice1, unit_price: 30.25, quantity: 5)
      create(:transaction, invoice: invoice1, result: 'success')

      invoice2 = create(:invoice, merchant: @merchant1)
      create_list(:invoice_item, 3, invoice: invoice2, unit_price: 20.25, quantity: 2)
      create(:transaction, invoice: invoice2, result: 'failed')

      # Merchant 2 Sales Data
      invoice3 = create(:invoice, merchant: @merchant2)
      create_list(:invoice_item, 3, invoice: invoice3, unit_price: 15.25, quantity: 5)
      create(:transaction, invoice: invoice3, result: 'success')

      invoice4 = create(:invoice, merchant: @merchant2)
      create_list(:invoice_item, 3, invoice: invoice4, unit_price: 32.25, quantity: 3)
      create(:transaction, invoice: invoice4, result: 'success')

      # Merchant 3 Sales Data
      invoice5 = create(:invoice, merchant: @merchant3)
      create_list(:invoice_item, 3, invoice: invoice5, unit_price: 10.25, quantity: 2)
      create(:transaction, invoice: invoice5, result: 'success')

      invoice6 = create(:invoice, merchant: @merchant3)
      create_list(:invoice_item, 3, invoice: invoice6, unit_price: 32.25, quantity: 3)
      create(:transaction, invoice: invoice6, result: 'failed')

      # Merchant 4 Sales Data
      invoice7 = create(:invoice, merchant: @merchant4)
      create_list(:invoice_item, 3, invoice: invoice7, unit_price: 10.25, quantity: 2)
      create(:transaction, invoice: invoice7, result: 'success', updated_at: '2018-09-02 12:00:00 UTC')
      end

      it '.top_merchants_by_revenue(n)' do
        expect(Merchant.top_merchants_by_revenue(3)).to eq([@merchant2, @merchant1, @merchant3])
      end

      it '.most_items(n)' do
        expect(Merchant.most_items(3)).to eq([@merchant2, @merchant1, @merchant3])
      end

      it '.total_revenue_by_date(date)' do
        expect(Merchant.total_revenue_by_date('2018-09-01').to_f).to eq(1095.75)
      end
    end
  end
end
