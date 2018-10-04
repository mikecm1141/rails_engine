require 'rails_helper'

describe 'Invoices API' do
  context 'get /api/v1/invoices/find_all?id=invoice_id' do
    it 'can find all invoices by id' do
      i1, i2, i3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find_all?id=#{i1.id}"
      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.first['id']).to eq(i1.id)
    end
  end

  context 'get /api/v1/invoices/find_all?merchant_id=invoice_merchant_id' do
    it 'can find all invoices by merchant_id' do
      i1, i2, i3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find_all?merchant_id=#{i1.merchant_id}"
      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.first['merchant_id']).to eq(i1.merchant_id)
    end
  end

  context 'get /api/v1/invoices/find_all?customer_id=invoice_customer_id' do
    it 'can find all invoices by customer_id' do
      i1, i2, i3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find_all?customer_id=#{i1.customer_id}"
      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.first['customer_id']).to eq(i1.customer_id)
    end
  end

  context 'get /api/v1/invoices/find_all?status=invoice_status' do
    it 'can find all invoices by status' do
      i1, i2, i3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find_all?status=#{i1.status}"
      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.first['status']).to eq(i1.status)
    end
  end

  context 'get /api/v1/invoices/find_all?created_at=created_at date' do
    it 'can find all invoices by created at' do
      m1, m2, m3 = create_list(:invoice, 3, created_at: '2018-01-01 00:00:00')
      m4 = create(:invoice, created_at: '2017-01-02 00:00:00')

      get "/api/v1/invoices/find_all?created_at=#{m1.created_at}"
      invoices = JSON.parse(response.body)

      expected_result = [invoices[0]['id'], invoices[1]['id'], invoices[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([m1.id, m2.id, m3.id])
    end
  end

  context 'get /api/v1/invoices/find_all?updated_at=updated_at date' do
    it 'can find all invoices by updated at' do
      m1, m2, m3 = create_list(:invoice, 3, updated_at: '2018-01-01 00:00:00')
      m4 = create(:invoice, updated_at: '2017-01-02 00:00:00')

      get "/api/v1/invoices/find_all?updated_at=#{m1.updated_at}"
      invoices = JSON.parse(response.body)

      expected_result = [invoices[0]['id'], invoices[1]['id'], invoices[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([m1.id, m2.id, m3.id])
    end
  end
end