require 'rails_helper'

describe 'Transactions API' do
  context 'get /api/v1/transactions/find?id=transaction_id' do
    it 'can find transaction by its id' do
      id = create(:transaction).id

      get "/api/v1/transactions/find?id=#{id}"

      transaction = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transaction['id']).to eq(id)
    end
  end

  context 'get /api/v1/transactions/find?credit_card_number=number' do
    it 'can find transaction by its credit_card_number' do
      cc = create(:transaction).credit_card_number

      get "/api/v1/transactions/find?credit_card_number=#{cc}"
      transaction = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transaction['credit_card_number']).to eq(cc)
    end
  end

  context 'get /api/v1/transactions/find?invoice_id=transaction_invoice_id' do
    it 'can find transaction by its invoice_id' do
      invoice_id = create(:transaction).invoice_id

      get "/api/v1/transactions/find?invoice_id=#{invoice_id}"
      transaction = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transaction['invoice_id']).to eq(invoice_id)
    end
  end

  context 'get /api/v1/transactions/find?result=transaction_result' do
    it 'can find transaction by its result' do
      result = create(:transaction).result

      get "/api/v1/transactions/find?result=#{result}"
      transaction = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transaction['result']).to eq(result)
    end
  end

  context 'get /api/v1/transactions/find?created_at=created_at date' do
    it 'can find transaction by its created_at date' do
      created_at = create(:transaction).created_at

      get "/api/v1/transactions/find?created_at=#{created_at}"

      transaction = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transaction['id']).to eq(Transaction.last.id)
    end
  end

  context 'get /api/v1/transactions/find?updated_at=updated_at date' do
    it 'can find transaction by its updated_at date' do
      updated_at = create(:transaction).updated_at

      get "/api/v1/transactions/find?updated_at=#{updated_at}"

      transaction = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transaction['id']).to eq(Transaction.last.id)
    end
  end
end