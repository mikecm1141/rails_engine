require 'rails_helper'

describe 'Invoice Items API' do
  context 'get /api/v1/invoice_items/random' do
    it 'can return a random invoice_item' do
      id = create(:invoice_item).id

      get '/api/v1/invoice_items/random'
      invoice_item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_item['id']).to eq(id)
    end
  end
end