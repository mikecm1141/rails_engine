require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many :items }
  it { should have_many :invoices }
  it { should have_many(:invoice_items).through(:invoices) }

  describe 'Class Methods' do
    it '.random' do
      m1, m2, m3 = create_list(:merchant, 3)

      expect(Merchant.random).to be_a(Merchant)
    end

    it '.top_merchants_by_revenue(x)' do
      merchant1, merchant2, merchant3, merchant4 = create_list(:merchant, 4)

      # Merchant 1 Sales Data
      invoice1 = create(:invoice, merchant: merchant1)
      create_list(:invoice_item, 3, invoice: invoice1, unit_price: 30.25, quantity: 5)
      create(:transaction, invoice: invoice1, result: 'success')

      invoice2 = create(:invoice, merchant: merchant1)
      create_list(:invoice_item, 3, invoice: invoice2, unit_price: 20.25, quantity: 3)
      create(:transaction, invoice: invoice2, result: 'failed')

      # Merchant 2 Sales Data
      invoice3 = create(:invoice, merchant: merchant2)
      create_list(:invoice_item, 3, invoice: invoice3, unit_price: 15.25, quantity: 5)
      create(:transaction, invoice: invoice3, result: 'success')

      invoice4 = create(:invoice, merchant: merchant2)
      create_list(:invoice_item, 3, invoice: invoice4, unit_price: 32.25, quantity: 3)
      create(:transaction, invoice: invoice4, result: 'success')

      # Merchant 3 Sales Data
      invoice5 = create(:invoice, merchant: merchant3)
      create_list(:invoice_item, 3, invoice: invoice5, unit_price: 10.25, quantity: 2)
      create(:transaction, invoice: invoice5, result: 'success')

      invoice6 = create(:invoice, merchant: merchant3)
      create_list(:invoice_item, 3, invoice: invoice6, unit_price: 32.25, quantity: 3)
      create(:transaction, invoice: invoice6, result: 'failed')

      # Merchant 4 Sales Data
      invoice7 = create(:invoice, merchant: merchant4)
      create_list(:invoice_item, 3, invoice: invoice7, unit_price: 10.25, quantity: 2)
      create(:transaction, invoice: invoice7, result: 'success')

      expect(Merchant.top_merchants_by_revenue(3)).to eq([merchant2, merchant1, merchant3])
    end
  end
end
