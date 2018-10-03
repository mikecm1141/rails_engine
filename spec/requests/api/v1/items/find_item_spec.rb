require 'rails_helper'

describe 'Items API' do
  context 'get /api/v1/items/find?id=item_id' do
    it 'can find item by its id' do
      id = create(:item).id

      get "/api/v1/items/find?id=#{id}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item['id']).to eq(id)
    end
  end

  context 'get /api/v1/items/find?name=item_name' do
    it 'can find item by its name' do
      name = create(:item).name

      get "/api/v1/items/find?name=#{name}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item['name']).to eq(name)
    end
  end

  context 'get /api/v1/items/find?description=item_description' do
    it 'can find item by its description' do
      description = create(:item).description

      get "/api/v1/items/find?description=#{description}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item['description']).to eq(description)
    end
  end

  context 'get /api/v1/items/find?unit_price=item_unit_price' do
    it 'can find item by its unit_price' do
      unit_price = create(:item).unit_price

      get "/api/v1/items/find?unit_price=#{unit_price}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item['unit_price']).to eq("#{unit_price.to_f}")
    end
  end

  context 'get /api/v1/items/find?merchant_id=merchant_id' do
    it 'can find item by its merchant id' do
      merchant_id = create(:item).merchant_id

      get "/api/v1/items/find?merchant_id=#{merchant_id}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item['merchant_id']).to eq(merchant_id)
    end
  end

  context 'get /api/v1/items/find?created_at=created_at date' do
    it 'can find item by its created_at date' do
      created_at = create(:item).created_at

      get "/api/v1/items/find?created_at=#{created_at}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item['name']).to eq(Item.last.name)
    end
  end

  context 'get /api/v1/items/find?updated_at=updated_at date' do
    it 'can find item by its updated_at date' do
      updated_at = create(:item).updated_at

      get "/api/v1/items/find?updated_at=#{updated_at}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item['name']).to eq(Item.last.name)
    end
  end
end