require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Relationships' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
  end

  describe 'Class Methods' do
    context 'Finder Methods' do
      it '.random' do
        m1, m2, m3 = create_list(:item, 3)

        expect(Item.random).to be_a(Item)
      end
    end

    context 'Business Intelligence' do
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

      it '.top_items_by_revenue(n)' do
        expect(Item.top_items_by_revenue(3)).to eq([@item3, @item2, @item1])
      end

      it '.top_items_by_quantity(rn)' do
        expect(Item.top_items_by_quantity(3)).to eq([@item3, @item2, @item1])
      end
    end
  end

  describe 'Instance Methods' do
    context 'Business Intelligence' do
      it '#best_day' do
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

        expect(item.best_day).to eq(invoice3.created_at)
      end
    end
  end
end
