require 'rails_helper'

describe 'Merchants API' do
	it 'sends a list of all merchants' do
		create_list(:merchant, 3)

		get '/api/v1/merchants'
		merchants = JSON.parse(response.body)

		expect(response).to be_successful
		expect(merchants.count).to eq(3)
	end

	it 'can show one merchant by id' do
		id = create(:merchant).id

		get "/api/v1/merchants/#{id}"

		merchant = JSON.parse(response.body)

		expect(response).to be_successful
		expect(merchant['id']).to eq(id)
	end
end