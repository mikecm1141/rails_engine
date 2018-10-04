require 'rails_helper'

describe 'Customers API' do
  context 'get /api/v1/customers/:id/invoices' do
    it 'returns the associated invoices' do
      customer = create(:customer)
      create_list(:invoice, 3, customer: customer)
      create(:invoice)

      get "/api/v1/customers/#{customer.id}/invoices"
      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.count).to eq(3)
    end
  end

  context 'get /api/v1/customers/:id/transactions' do
    it 'returns the associated transactions' do
      customer = create(:customer)
      invoice  = create(:invoice, customer: customer)
      create_list(:transaction, 3, invoice: invoice)
      create(:transaction)

      get "/api/v1/customers/#{customer.id}/transactions"
      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.count).to eq(3)
    end
  end
end
