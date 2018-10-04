require 'rails_helper'

describe 'Invoice Items API' do
  context 'get /api/v1/invoice_items/:id/invoice' do
    it 'returns the associated invoice' do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['id']).to eq(invoice_item.invoice.id)
    end
  end

  context 'get /api/v1/invoice_items/:id/item' do
    it 'returns the associated item' do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/#{invoice_item.id}/item"
      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item['id']).to eq(invoice_item.item.id)
    end
  end
end