require 'rails_helper'

describe 'Transactions API' do
  context 'get /api/v1/transactions/find_all?id=id' do
    it 'can find all transactions by id' do
      trans1, trans2, trans3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?id=#{trans1.id}"
      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.first['id']).to eq(trans1.id)
    end
  end

  context 'get /api/v1/transactions/find_all?credit_card_number=ccnumber' do
    it 'can find all transactions by credit_card_number' do
      trans1, trans2, trans3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?credit_card_number=#{trans1.credit_card_number}"
      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.first['credit_card_number']).to eq(trans1.credit_card_number)
    end
  end

  context 'get /api/v1/transactions/find_all?invoice_id=invoice_id' do
    it 'can find all transactions by invoice_id' do
      trans1, trans2, trans3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?invoice_id=#{trans1.invoice_id}"
      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.first['invoice_id']).to eq(trans1.invoice_id)
    end
  end

  context 'get /api/v1/transactions/find_all?result=result' do
    it 'can find all transactions by result' do
      trans1, trans2, trans3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?result=#{trans1.result}"
      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.first['result']).to eq(trans1.result)
    end
  end

  context 'get /api/v1/transactions/find_all?created_at=created_at date' do
    it 'can find all transactions by created at' do
      transaction1, transaction2, transaction3 = create_list(:transaction, 3, created_at: '2018-01-01 00:00:00')
      m4 = create(:transaction, created_at: '2017-01-02 00:00:00')

      get "/api/v1/transactions/find_all?created_at=#{transaction1.created_at}"
      transactions = JSON.parse(response.body)

      expected_result = [transactions[0]['id'], transactions[1]['id'], transactions[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([transaction1.id, transaction2.id, transaction3.id])
    end
  end

  context 'get /api/v1/transactions/find_all?updated_at=updated_at date' do
    it 'can find all transactions by created at' do
      transaction1, transaction2, transaction3 = create_list(:transaction, 3, updated_at: '2018-01-01 00:00:00')
      m4 = create(:transaction, updated_at: '2017-01-02 00:00:00')

      get "/api/v1/transactions/find_all?updated_at=#{transaction1.updated_at}"
      transactions = JSON.parse(response.body)

      expected_result = [transactions[0]['id'], transactions[1]['id'], transactions[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([transaction1.id, transaction2.id, transaction3.id])
    end
  end
end