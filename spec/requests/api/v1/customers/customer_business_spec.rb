require 'rails_helper'

describe 'Customers API' do
  describe 'Business Intelligence Endpoint' do
    context 'get /api/v1/customers/:id/favorite_merchant' do
      it 'returns a merchant where the customer has conducted the most succesful transactions' do
        customer = create(:customer)
        merchant1, merchant2 = create_list(:merchant, 2)

        # Merchant 1 Transactions
        invoice1, invoice2 = create_list(:invoice, 2, customer: customer, merchant: merchant1)
        create(:transaction, invoice: invoice1, result: 'success')
        create(:transaction, invoice: invoice2, result: 'success')

        # Merchant 2 Transaction
        invoice3 = create(:invoice, merchant: merchant2)
        create(:transaction, invoice: invoice3, result: 'success')

        get "/api/v1/customers/#{customer.id}/favorite_merchant"
        merchant = JSON.parse(response.body)

        expected_result = {
          "id"   => merchant1.id,
          "name" => merchant1.name
        }

        expect(response).to be_successful
        expect(merchant).to eq(expected_result)
      end
    end
  end
end