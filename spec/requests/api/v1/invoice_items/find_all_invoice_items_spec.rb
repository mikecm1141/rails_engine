require 'rails_helper'

describe 'Invoice Items API' do
  context 'get /api/v1/invoice_items/find_all?id=invoice_id' do
    it 'can find all invoice_items by id' do
      i1, i2, i3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find_all?id=#{i1.id}"
      invoice_items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_items.first['id']).to eq(i1.id)
    end
  end

  context 'get /api/v1/invoice_items/find_all?item_id=invoice_item_item_id' do
    it 'can find all invoice_items by item_id' do
      i1, i2, i3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find_all?item_id=#{i1.item_id}"
      invoice_items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_items.first['item_id']).to eq(i1.item_id)
    end
  end

  context 'get /api/v1/invoice_items/find_all?invoice_id=invoice_item_invoice_id' do
    it 'can find all invoice_items by invoice_id' do
      i1, i2, i3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find_all?invoice_id=#{i1.invoice_id}"
      invoice_items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_items.first['invoice_id']).to eq(i1.invoice_id)
    end
  end

  context 'get /api/v1/invoice_items/find_all?quantity=invoice_item_quantity' do
    it 'can find all invoice_items by quantity' do
      i1, i2, i3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find_all?quantity=#{i1.quantity}"
      invoice_items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_items.first['quantity']).to eq(i1.quantity)
    end
  end

  context 'get /api/v1/invoice_items/find_all?unit_price=invoice_item_unit_price' do
    it 'can find all invoice_items by unit_price' do
      i1, i2, i3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find_all?unit_price=#{i1.unit_price}"
      invoice_items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_items.first['unit_price']).to eq("#{i1.unit_price}")
    end
  end

  context 'get /api/v1/invoice_items/find_all?created_at=created_at date' do
    it 'can find all invoice_items by created at' do
      invoice_item1, invoice_item2, invoice_item3 = create_list(:invoice_item, 3, created_at: '2018-01-01 00:00:00')
      m4 = create(:invoice_item, created_at: '2017-01-02 00:00:00')

      get "/api/v1/invoice_items/find_all?created_at=#{invoice_item1.created_at}"
      invoice_items = JSON.parse(response.body)

      expected_result = [invoice_items[0]['id'], invoice_items[1]['id'], invoice_items[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([invoice_item1.id, invoice_item2.id, invoice_item3.id])
    end
  end

  context 'get /api/v1/invoice_items/find_all?updated_at=updated_at date' do
    it 'can find all invoice_items by updated at' do
      invoice_item1, invoice_item2, invoice_item3 = create_list(:invoice_item, 3, updated_at: '2018-01-01 00:00:00')
      m4 = create(:invoice_item, updated_at: '2017-01-02 00:00:00')

      get "/api/v1/invoice_items/find_all?updated_at=#{invoice_item1.updated_at}"
      invoice_items = JSON.parse(response.body)

      expected_result = [invoice_items[0]['id'], invoice_items[1]['id'], invoice_items[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([invoice_item1.id, invoice_item2.id, invoice_item3.id])
    end
  end
end