require 'rails_helper'

describe 'Items API' do
  context 'get /api/v1/items' do
    it 'sends a list of all items' do
      create_list(:item, 3)

      get '/api/v1/items'
      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.count).to eq(3)
    end
  end

  context 'get /api/v1/items/:id' do
    it 'can show one item by id' do
      id = create(:item).id

      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item['id']).to eq(id)
    end
  end
end