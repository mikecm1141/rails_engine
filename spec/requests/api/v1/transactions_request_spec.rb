require 'rails_helper'

describe 'Transactions API' do
  context 'get /api/v1/transactions' do
    it 'sends a list of all transactions' do
      create_list(:transaction, 3)

      get '/api/v1/transactions'
      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.count).to eq(3)
    end
  end

  context 'get /api/v1/transactions/:id' do
    it 'can show one transaction by id' do
      id = create(:transaction).id

      get "/api/v1/transactions/#{id}"
      transaction = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transaction['id']).to eq(id)
    end
  end
end