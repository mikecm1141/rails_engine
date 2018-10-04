require 'rails_helper'

describe 'Customers API' do
  context 'get /api/v1/customers/find_all?id=customer_id' do
    it 'can find all customers by id' do
      customer1, customer2, customer3 = create_list(:customer, 3)

      get "/api/v1/customers/find_all?id=#{customer1.id}"
      customers = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customers.first['id']).to eq(customer1.id)
    end
  end

  context 'get /api/v1/customers/find_all?first_name=customer_first_name' do
    it 'can find all customers by first_name' do
      customer1, customer2, customer3 = create_list(:customer, 3)

      get "/api/v1/customers/find_all?first_name=#{customer1.first_name}"
      customers = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customers.first['first_name']).to eq(customer1.first_name)
    end
  end

  context 'get /api/v1/customers/find_all?last_name=customer_last_name' do
    it 'can find all customers by last_name' do
      customer1, customer2, customer3 = create_list(:customer, 3)

      get "/api/v1/customers/find_all?last_name=#{customer1.last_name}"
      customers = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customers.first['last_name']).to eq(customer1.last_name)
    end
  end

  context 'get /api/v1/customers/find_all?created_at=created_at date' do
    it 'can find all customers by created at' do
      customer1, customer2, customer3 = create_list(:customer, 3, created_at: '2018-01-01 00:00:00')
      customer4 = create(:customer, created_at: '2017-01-02 00:00:00')

      get "/api/v1/customers/find_all?created_at=#{customer1.created_at}"
      customers = JSON.parse(response.body)

      expected_result = [customers[0]['id'], customers[1]['id'], customers[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([customer1.id, customer2.id, customer3.id])
    end
  end

  context 'get /api/v1/customers/find_all?updated_at=updated_at date' do
    it 'can find all customers by updated at' do
      customer1, customer2, customer3 = create_list(:customer, 3, updated_at: '2018-01-01 00:00:00')
      customer4 = create(:customer, updated_at: '2017-01-02 00:00:00')

      get "/api/v1/customers/find_all?updated_at=#{customer1.updated_at}"
      customers = JSON.parse(response.body)

      expected_result = [customers[0]['id'], customers[1]['id'], customers[2]['id']]

      expect(response).to be_successful
      expect(expected_result).to eq([customer1.id, customer2.id, customer3.id])
    end
  end
end