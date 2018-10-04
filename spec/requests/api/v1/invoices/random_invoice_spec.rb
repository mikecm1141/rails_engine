require 'rails_helper'

describe 'Invoices API' do
  context 'get /api/v1/invoices/random' do
    it 'can return a random invoice' do
      id = create(:invoice).id

      get '/api/v1/invoices/random'
      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['id']).to eq(id)
    end
  end
end