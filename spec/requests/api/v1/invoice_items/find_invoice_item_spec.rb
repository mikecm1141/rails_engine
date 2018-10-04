require 'rails_helper'

    # t.bigint "item_id"
    # t.bigint "invoice_id"
    # t.integer "quantity"
    # t.decimal "unit_price", precision: 8, scale: 2
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

describe 'Invoice Item API' do
  context 'get /api/v1/invoice_items/find?id=invoice_item_id' do
    it 'can find invoice_item by its id' do
      id = create(:invoice_item).id

      get "/api/v1/invoice_items/find?id=#{id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['id']).to eq(id)
    end
  end

  context 'get /api/v1/invoice_items/find?item_id=invoice_item_item_id' do
    it 'can find invoice_item by its item id' do
      item_id = create(:invoice_item).item_id

      get "/api/v1/invoice_items/find?item_id=#{item_id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['item_id']).to eq(item_id)
    end
  end

  context 'get /api/v1/invoice_items/find?invoice_id=invoice_item_invoice_id' do
    it 'can find invoice_item by its invoice id' do
      invoice_id = create(:invoice_item).invoice_id

      get "/api/v1/invoice_items/find?invoice_id=#{invoice_id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['invoice_id']).to eq(invoice_id)
    end
  end

  context 'get /api/v1/invoice_items/find?quantity=invoice_item_quantity' do
    it 'can find invoice_item by its invoice id' do
      quantity = create(:invoice_item).quantity

      get "/api/v1/invoice_items/find?quantity=#{quantity}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['quantity']).to eq(quantity)
    end
  end

  context 'get /api/v1/invoice_items/find?unit_price=invoice_item_unit_price' do
    it 'can find invoice_item by its invoice id' do
      unit_price = create(:invoice_item).unit_price

      get "/api/v1/invoice_items/find?unit_price=#{unit_price}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['unit_price']).to eq("#{unit_price}")
    end
  end

  context 'get /api/v1/invoice_items/find?created_at=created_at date' do
    it 'can find invoice_item by its created_at date' do
      created_at = create(:invoice_item).created_at

      get "/api/v1/invoice_items/find?created_at=#{created_at}"

      invoice_item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_item['id']).to eq(InvoiceItem.last.id)
    end
  end

  context 'get /api/v1/invoice_items/find?updated_at=updated_at date' do
    it 'can find invoice_item by its updated_at date' do
      updated_at = create(:invoice_item).updated_at

      get "/api/v1/invoice_items/find?updated_at=#{updated_at}"

      invoice_item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_item['id']).to eq(InvoiceItem.last.id)
    end
  end
end