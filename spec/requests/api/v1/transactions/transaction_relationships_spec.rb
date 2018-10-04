require 'rails_helper'

describe 'Transactions API' do
  context 'get /api/v1/transactions/:id/invoice' do
    it 'returns the associated invoice' do
      transaction = create(:transaction)

      get "/api/v1/transactions/#{transaction.id}/invoice"
      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['id']).to eq(transaction.invoice.id)
    end
  end
end