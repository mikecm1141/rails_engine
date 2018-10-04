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

  # context 'get /api/v1/invoices/find_all?created_at=created_at date' do
  #   it 'can find all invoices by created at' do
  #     m1, m2, m3 = create_list(:invoice, 3, created_at: '2018-01-01 00:00:00')
  #     m4 = create(:invoice, created_at: '2017-01-02 00:00:00')

  #     get "/api/v1/invoices/find_all?created_at=#{m1.created_at}"
  #     invoices = JSON.parse(response.body)

  #     expected_result = [invoices[0]['id'], invoices[1]['id'], invoices[2]['id']]

  #     expect(response).to be_successful
  #     expect(expected_result).to eq([m1.id, m2.id, m3.id])
  #   end
  # end

  # context 'get /api/v1/invoices/find_all?updated_at=updated_at date' do
  #   it 'can find all invoices by updated at' do
  #     m1, m2, m3 = create_list(:invoice, 3, updated_at: '2018-01-01 00:00:00')
  #     m4 = create(:invoice, updated_at: '2017-01-02 00:00:00')

  #     get "/api/v1/invoices/find_all?updated_at=#{m1.updated_at}"
  #     invoices = JSON.parse(response.body)

  #     expected_result = [invoices[0]['id'], invoices[1]['id'], invoices[2]['id']]

  #     expect(response).to be_successful
  #     expect(expected_result).to eq([m1.id, m2.id, m3.id])
  #   end
  # end
end