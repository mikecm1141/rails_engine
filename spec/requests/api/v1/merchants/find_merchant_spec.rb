require 'rails_helper'
describe 'Merchants API' do
  context 'get /api/v1/merchants/find?id=merchant_id' do
    it 'can find merchant by its id' do
      id = create(:merchant).id

      get "/api/v1/merchants/find?id=#{id}"

      merchant = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant['id']).to eq(id)
    end
  end

  context 'get /api/v1/merchants/find?name=merchant_name' do
    it 'can find merchant by its name' do
      name = create(:merchant).name

      get "/api/v1/merchants/find?name=#{name}"

      merchant = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant['name']).to eq(name)
    end
  end

  context 'get /api/v1/merchants/find?created_at=created_at date' do
    it 'can find merchant by created at timestamp' do
      date = create(:merchant).created_at

      get "/api/v1/merchants/find?created_at=#{date}"

      merchant = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant['name']).to eq(Merchant.last.name)
    end
  end

  context 'get /api/v1/merchants/find?updated_at=updated_at date' do
    it 'can find merchant by updated at timestamp' do
      date = create(:merchant).updated_at

      get "/api/v1/merchants/find?updated_at=#{date}"

      merchant = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant['name']).to eq(Merchant.last.name)
    end
  end
end