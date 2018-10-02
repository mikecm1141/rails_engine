require 'rails_helper'

describe 'Customer API' do
  it 'sends a list of all customers' do
    create_list(:customer, 3)

    get '/api/v1/customers'
    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(3)
  end

  it 'can show one customer by id' do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"
    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer['id']).to eq(id)
  end
end