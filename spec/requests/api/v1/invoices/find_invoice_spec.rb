require 'rails_helper'

describe 'Invoices API' do
  context 'get /api/v1/invoices/find?id=invoice_id' do
    it 'can find invoice by its id' do
      id = create(:invoice).id

      get "/api/v1/invoices/find?id=#{id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['id']).to eq(id)
    end
  end

  context 'get /api/v1/invoices/find?merchant_id=invoice_merchant_id' do
    it 'can find invoice by its merchant id' do
      merchant_id = create(:invoice).merchant_id

      get "/api/v1/invoices/find?merchant_id=#{merchant_id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['merchant_id']).to eq(merchant_id)
    end
  end

  context 'get /api/v1/invoices/find?customer_id=invoice_customer_id' do
    it 'can find invoice by its customer_id' do
      customer_id = create(:invoice).customer_id

      get "/api/v1/invoices/find?customer_id=#{customer_id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['customer_id']).to eq(customer_id)
    end
  end

  context 'get /api/v1/invoices/find?status=invoice_status' do
    it 'can find invoice by its status' do
      status = create(:invoice).status

      get "/api/v1/invoices/find?status=#{status}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['status']).to eq(status)
    end
  end

  context 'get /api/v1/invoices/find?created_at=created_at date' do
    it 'can find invoice by its created_at date' do
      created_at = create(:invoice).created_at

      get "/api/v1/invoices/find?created_at=#{created_at}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['id']).to eq(Invoice.last.id)
    end
  end

  context 'get /api/v1/invoices/find?updated_at=updated_at date' do
    it 'can find invoice by its updated_at date' do
      updated_at = create(:invoice).updated_at

      get "/api/v1/invoices/find?updated_at=#{updated_at}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['id']).to eq(Invoice.last.id)
    end
  end
end