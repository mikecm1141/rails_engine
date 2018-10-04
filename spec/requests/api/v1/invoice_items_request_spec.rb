require 'rails_helper'

describe 'Invoice Items API' do
  context 'get /api/v1/invoice_items' do
    it 'sends a list of all invoice items' do
      create_list(:invoice_item, 3)

      get '/api/v1/invoice_items'
      invoice_items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_items.count).to eq(3)
    end
  end

  context 'get /api/v1/invoice_items/:id' do
    it 'can show one invoice item by id' do
      id = create(:invoice_item).id

      get "/api/v1/invoice_items/#{id}"
      invoice_item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_item['id']).to eq(id)
    end
  end
end