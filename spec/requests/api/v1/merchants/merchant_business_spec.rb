require 'rails_helper'

describe 'Merchants API' do
  describe 'All Merchants' do
    it 'returns top x merchants by total revenue' do
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

      get '/api/v1/merchants/most_revenue?quantity=3'
      top_merchants = JSON.parse(response.body)

      expect(response).to be_successful
      expect(top_merchants.count).to eq(3)
      expect(top_merchants).to eq([merchant2.as_json, merchant1.as_json, merchant3.as_json])
    end
  end
end