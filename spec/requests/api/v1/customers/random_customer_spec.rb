require 'rails_helper'

describe 'Customers API' do
  context 'get /api/v1/customers/random' do
    it 'can return a random customer' do
      id = create(:customer).id

      get '/api/v1/customers/random'
      customer = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customer['id']).to eq(id)
    end
  end
end