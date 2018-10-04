require 'rails_helper'

describe 'Customers API' do
  context 'get /api/v1/customers/find?id=customer_id' do
    it 'can find customer by its id' do
      id = create(:customer).id

      get "/api/v1/customers/find?id=#{id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['id']).to eq(id)
    end
  end

  context 'get /api/v1/customers/find?first_name=first_name' do
    it 'can find customer by its first_name' do
      first_name = create(:customer).first_name

      get "/api/v1/customers/find?first_name=#{first_name}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['first_name']).to eq(first_name)
    end
  end

  context 'get /api/v1/customers/find?last_name=customer_last_name' do
    it 'can find customer by its last_name' do
      last_name = create(:customer).last_name

      get "/api/v1/customers/find?last_name=#{last_name}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice['last_name']).to eq(last_name)
    end
  end

  context 'get /api/v1/customers/find?created_at=created_at date' do
    it 'can find customer by its created_at date' do
      created_at = create(:customer).created_at

      get "/api/v1/customers/find?created_at=#{created_at}"

      customer = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customer['id']).to eq(Customer.last.id)
    end
  end

  context 'get /api/v1/customers/find?updated_at=updated_at date' do
    it 'can find customer by its updated_at date' do
      updated_at = create(:customer).updated_at

      get "/api/v1/customers/find?updated_at=#{updated_at}"

      customer = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customer['id']).to eq(Customer.last.id)
    end
  end
end
