require 'rails_helper'

describe 'Transactions API' do
  context 'get /api/v1/transactions/random' do
    it 'can return a random transaction' do
      id = create(:transaction).id

      get '/api/v1/transactions/random'
      transaction = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transaction['id']).to eq(id)
    end
  end
end