require 'rails_helper'

describe 'Items API' do
  context 'get /api/v1/items/find_all?id=item_id' do
    it 'can find all items by id' do
      i1, i2, i3 = create_list(:item, 3)

      get "/api/v1/items/find_all?id=#{i1.id}"
      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.first['id']).to eq(i1.id)
    end
  end

  context 'get /api/v1/items/find_all?name=item_name' do
    it 'can find all items by name' do
      i1, i2, i3 = create_list(:item, 3)

      get "/api/v1/items/find_all?name=#{i1.name}"
      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.first['name']).to eq(i1.name)
    end
  end

  context 'get /api/v1/items/find_all?description=item_description' do
    it 'can find all items by description' do
      i1, i2, i3 = create_list(:item, 3)

      get "/api/v1/items/find_all?description=#{i1.description}"
      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.first['description']).to eq(i1.description)
    end
  end

  context 'get /api/v1/items/find_all?unit_price=item_unit_price' do
    it 'can find all items by unit price' do
      i1, i2, i3 = create_list(:item, 3)

      get "/api/v1/items/find_all?unit_price=#{i1.unit_price}"
      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.first['unit_price']).to eq("#{i1.unit_price}")
    end
  end

  context 'get /api/v1/items/find_all?merchant_id=item_merchant_id' do
    it 'can find all items by merchant id' do
      i1, i2, i3 = create_list(:item, 3)

      get "/api/v1/items/find_all?merchant_id=#{i1.merchant_id}"
      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.first['merchant_id']).to eq(i1.merchant_id)
    end
  end

  context 'get /api/v1/items/find_all?description=item_description' do
    it 'can find all items by description' do
      i1, i2, i3 = create_list(:item, 3)

      get "/api/v1/items/find_all?description=#{i1.description}"
      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.first['description']).to eq(i1.description)
    end
  end

  context 'get /api/v1/items/find_all?created_at=created_at date' do
    it 'can find all items by created at' do
      m1, m2, m3 = create_list(:item, 3, created_at: '2018-01-01 00:00:00')
      m4 = create(:item, created_at: '2017-01-02 00:00:00')

      get "/api/v1/items/find_all?created_at=#{m1.created_at}"
      items = JSON.parse(response.body)

      expected_result = [items[0]['id'], items[1]['id'], items[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([m1.id, m2.id, m3.id])
    end
  end

  context 'get /api/v1/items/find_all?updated_at=updated_at date' do
    it 'can find all items by updated at' do
      m1, m2, m3 = create_list(:item, 3, updated_at: '2018-01-01 00:00:00')
      m4 = create(:item, updated_at: '2017-01-02 00:00:00')

      get "/api/v1/items/find_all?updated_at=#{m1.updated_at}"
      items = JSON.parse(response.body)

      expected_result = [items[0]['id'], items[1]['id'], items[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([m1.id, m2.id, m3.id])
    end
  end
end