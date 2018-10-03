require 'rails_helper'

describe 'Merchants API' do
  context 'get /api/v1/merchants/find_all?id=merchant_id' do
    it 'can find all merchants by id' do
      m1, m2, m3 = create_list(:merchant, 3)

      get "/api/v1/merchants/find_all?id=#{m1.id}"
      merchants = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchants.first['id']).to eq(m1.id)
    end
  end

  context 'get /api/v1/merchants/find_all?name=merchant_name' do
    it 'can find all merchants by name' do
      m1, m2, m3 = create_list(:merchant, 3)

      get "/api/v1/merchants/find_all?name=#{m1.name}"
      merchants = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchants.first['name']).to eq(m1.name)
    end
  end

  context 'get /api/v1/merchants/find_all?created_at=created_at date' do
    it 'can find all merchants by created at' do
      m1, m2, m3 = create_list(:merchant, 3, created_at: '2018-01-01 00:00:00')
      m4 = create(:merchant, created_at: '2017-01-02 00:00:00')

      get "/api/v1/merchants/find_all?created_at=#{m1.created_at}"
      merchants = JSON.parse(response.body)

      expected_result = [merchants[0]['id'], merchants[1]['id'], merchants[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([m1.id, m2.id, m3.id])
    end
  end

  context 'get /api/v1/merchants/find_all?updated_at=updated_at date' do
    it 'can find all merchants by updated at' do
      m1, m2, m3 = create_list(:merchant, 3, updated_at: '2018-01-01 00:00:00')
      m4 = create(:merchant, updated_at: '2017-01-02 00:00:00')

      get "/api/v1/merchants/find_all?updated_at=#{m1.updated_at}"
      merchants = JSON.parse(response.body)

      expected_result = [merchants[0]['id'], merchants[1]['id'], merchants[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([m1.id, m2.id, m3.id])
    end
  end
end