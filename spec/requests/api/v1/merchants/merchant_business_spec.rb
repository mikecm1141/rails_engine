require 'rails_helper'

describe 'Merchants API' do
  describe 'All Merchants' do
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

    it 'returns top n merchants by total revenue' do
      amount = 3
      get "/api/v1/merchants/most_revenue?quantity=#{amount}"

      top_merchants = JSON.parse(response.body)

      expected_result = [@merchant2, @merchant1, @merchant3].map do |merchant|
        {
          "id"   => merchant.id,
          "name" => merchant.name
        }
      end

      expect(response).to be_successful
      expect(top_merchants.count).to eq(3)
      expect(top_merchants).to eq(expected_result)
    end

    it 'returns top n merchants by number of total items sold' do
      amount = 3
      get "/api/v1/merchants/most_items?quantity=#{amount}"

      merchants_by_items = JSON.parse(response.body)

      expect(response).to be_successful
    end

    it 'returns total revenue for date x across all merchants' do
      test_date = '2018-09-01 12:00:00 UTC'
      get "/api/v1/merchants/revenue?date=#{test_date}"

      revenue_total_by_date = JSON.parse(response.body)

      expected_result = { "total_revenue" => "1095.75" }

      expect(response).to be_successful
      expect(revenue_total_by_date).to eq(expected_result)
    end
  end

  describe 'Single Merchant' do
    before(:each) do
      @merchant = create(:merchant)
      @date = '2018-09-02 00:00:00 UTC'

      invoice1 = create(:invoice, merchant: @merchant)
      create_list(:invoice_item, 2, invoice: invoice1, unit_price: 10.5, quantity: 2)
      create(:transaction, invoice: invoice1, result: 'success')

      invoice2 = create(:invoice, merchant: @merchant)
      create_list(:invoice_item, 2, invoice: invoice2, unit_price: 12.25, quantity: 1)
      create(:transaction, invoice: invoice2, result: 'failed')

      invoice3 = create(:invoice, merchant: @merchant, updated_at: @date)
      create_list(:invoice_item, 3, invoice: invoice3, unit_price: 15.25, quantity: 2)
      create(:transaction, invoice: invoice3, result: 'success')
    end

    context 'get /api/v1/merchants/:id/revenue' do
      it 'returns the valid total revenue for that merchant' do
        get "/api/v1/merchants/#{@merchant.id}/revenue"
        total_revenue = JSON.parse(response.body)

        expected_result = 133.5

        expect(response).to be_successful
        expect(total_revenue).to eq({ "revenue" => "#{expected_result}" })
      end
    end

    context 'get /api/v1/merchants/:id/revenue?date=x' do
      it 'returns the valid ttoal revenue for merchant on a date' do
        get "/api/v1/merchants/#{@merchant.id}/revenue?date=#{@date}"
        total_revenue_by_date = JSON.parse(response.body)

        expected_result = 91.5

        expect(response).to be_successful
        expect(total_revenue_by_date).to eq({ "revenue" => "#{expected_result}" })
      end
    end
  end
end