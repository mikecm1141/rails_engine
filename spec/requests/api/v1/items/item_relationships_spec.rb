require 'rails_helper'

describe 'Items API' do
  context 'get /api/v1/items/:id/merchant' do
    it 'returns the associated merchant' do
      item = create(:item)

      get "/api/v1/items/#{item.id}/merchant"
      merchant = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant['id']).to eq(item.merchant_id)
    end
  end

  context 'get /api/v1/items/:id/invoice_items' do
    it 'returns collection of associated invoice items' do
      item = create(:item)
      invoice1, invoice2 = create_list(:invoice, 2)
      invoice_item1, invoice_item2 = create_list(:invoice_item, 2, invoice: invoice1, item: item)
      invoice_item3, invoice_item4 = create_list(:invoice_item, 2, invoice: invoice2, item: item)

      get "/api/v1/items/#{item.id}/invoice_items"
      invoice_items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_items.count).to eq(4)
    end
  end
end