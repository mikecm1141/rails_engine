require 'rails_helper'

describe 'Merchants API' do
  context 'get /api/v1/merchants/random' do
    it 'can return a random merchant' do
      id = create(:merchant).id

      get '/api/v1/merchants/random'
      merchant = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant['id']).to eq(id)
    end
  end
end