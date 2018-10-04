require 'rails_helper'

describe 'Items API' do
  describe 'All Items' do
    before(:each) do
      @item1, @item2, @item3, @item4 = create_list(:item, 4)

      invoice1, invoice2 = create_list(:invoice, 2)

      create(:invoice_item, invoice: invoice1, item: @item1, quantity: 2, unit_price: 100.25)
      create(:invoice_item, invoice: invoice1, item: @item2, quantity: 1, unit_price: 50.0)
      create(:invoice_item, invoice: invoice1, item: @item3, quantity: 3, unit_price: 150.50)
      create(:invoice_item, invoice: invoice1, item: @item4, quantity: 1, unit_price: 25.0)
      create(:transaction, invoice: invoice1, result: 'success')

      create(:invoice_item, invoice: invoice2, item: @item1, quantity: 1, unit_price: 50.0)
      create(:invoice_item, invoice: invoice2, item: @item2, quantity: 3, unit_price: 75.0)
      create(:invoice_item, invoice: invoice2, item: @item3, quantity: 4, unit_price: 102.0)
      create(:invoice_item, invoice: invoice2, item: @item4, quantity: 1, unit_price: 10.0)
      create(:transaction, invoice: invoice2, result: 'success')
    end

    context 'get /api/v1/items/most_revenue?quantity=n' do
      it 'returns the top n items ranked by total revenue generated' do
        amount = 3
        get "/api/v1/items/most_revenue?quantity=#{amount}"
        top_revenue_items = JSON.parse(response.body)

        expected_result = [@item3, @item2, @item1].map do |item|
          {
            "id"          => item.id,
            "name"        => item.name,
            "description" => item.description,
            "merchant_id" => item.merchant_id,
            "unit_price"  => "#{item.unit_price.to_f}",
          }
        end

        expect(response).to be_successful
        expect(top_revenue_items.count).to eq(3)
        expect(top_revenue_items).to eq(expected_result)
      end
    end

    context 'get /api/v1/items/most_items?quantity=n' do
      it 'returns the top n item instances ranked by total number sold' do
        amount = 3
        get "/api/v1/items/most_items?quantity=#{amount}"
        most_sold_items = JSON.parse(response.body)

        expected_result = [@item3, @item2, @item1].map do |item|
          {
            "id"          => item.id,
            "name"        => item.name,
            "description" => item.description,
            "merchant_id" => item.merchant_id,
            "unit_price"  => "#{item.unit_price.to_f}",
          }
        end

        expect(response).to be_successful
        expect(most_sold_items.count).to eq(3)
        expect(most_sold_items).to eq(expected_result)
      end
    end
  end

  describe 'Single Item' do
    context 'get /api/v1/items/:id/best_day' do
      it 'returns the date with the most sales for that item' do
        item = create(:item)

        invoice1 = create(:invoice, created_at: '2018-09-01 00:00:00 UTC')
        create(:invoice_item, invoice: invoice1, item: item, quantity: 5)
        create(:transaction, invoice: invoice1, result: 'success')

        invoice2 = create(:invoice, created_at: '2018-09-02 00:00:00 UTC')
        create(:invoice_item, invoice: invoice2, item: item, quantity: 2)
        create(:transaction, invoice: invoice2, result: 'success')

        invoice3 = create(:invoice, created_at: '2018-09-03 00:00:00 UTC')
        create(:invoice_item, invoice: invoice3, item: item, quantity: 5)
        create(:transaction, invoice: invoice3, result: 'success')

        get "/api/v1/items/#{item.id}/best_day"
        date_most_sold = JSON.parse(response.body)

        expected_result = invoice3.created_at.as_json

        expect(response).to be_successful
        expect(date_most_sold['best_day']).to eq(expected_result)
      end
    end
  end
end