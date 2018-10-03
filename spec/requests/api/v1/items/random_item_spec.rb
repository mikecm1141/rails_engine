require 'rails_helper'

describe 'Items API' do
  context 'get /api/v1/items/random' do
    it 'can return a random item' do
      id = create(:item).id

      get '/api/v1/items/random'
      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item['id']).to eq(id)
    end
  end
end