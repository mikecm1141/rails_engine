require 'rails_helper'

describe 'Merchants API' do
  it 'returns all items associated with that merchant' do
    merchant = create(:merchant)
    merchant.items << create_list(:item, 3)
    create_list(:item, 2)

    get "/api/v1/merchants/#{merchant.id}/items"
    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items.count).to eq(3)
  end

  it 'returns all invoices associated with that merchant' do
    merchant = create(:merchant)
    merchant.invoices << create_list(:invoice, 3)
    create_list(:invoice, 2)

    get "/api/v1/merchants/#{merchant.id}/invoices"
    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices.count).to eq(3)
  end
end