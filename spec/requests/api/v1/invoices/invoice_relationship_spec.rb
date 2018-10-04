require 'rails_helper'

describe 'Invoices API' do
  context 'get /api/v1/invoices/:id/transactions' do
    it 'returns a collection of associated transactions' do
      invoice = create(:invoice)
      trans1, trans2 = create_list(:transaction, 2, invoice: invoice)
      create(:transaction)

      get "/api/v1/invoices/#{invoice.id}/transactions"
      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.count).to eq(2)
    end
  end

  context 'get /api/v1/invoices/:id/invoice_items' do
    it 'returns a collection of associated invoice items' do
      invoice = create(:invoice)
      invoice_item1, invoice_item2 = create_list(:invoice_item, 2, invoice: invoice)
      create(:invoice_item)

      get "/api/v1/invoices/#{invoice.id}/invoice_items"
      invoice_items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_items.count).to eq(2)
    end
  end

  context 'get /api/v1/invoices/:id/items' do
    it 'returns a collection of associated items' do
      invoice = create(:invoice)
      create_list(:invoice_item, 2, invoice: invoice)
      create(:item)

      get "/api/v1/invoices/#{invoice.id}/items"
      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.count).to eq(2)
    end
  end

  context 'get /api/v1/invoices/:id/customer' do
    it 'returns the associated customer' do
      customer = create(:customer)
      invoice = create(:invoice, customer: customer)

      get "/api/v1/invoices/#{invoice.id}/customer"
      customer_return = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customer_return['first_name']).to eq(customer.first_name)
    end
  end

  context 'get /api/v1/invoices/:id/merchant' do
    it 'returns the associated merchant' do
      merchant = create(:merchant)
      invoice  = create(:invoice, merchant: merchant)

      get "/api/v1/invoices/#{invoice.id}/merchant"
      merchant_return = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant_return['name']).to eq(merchant.name)
    end
  end
end