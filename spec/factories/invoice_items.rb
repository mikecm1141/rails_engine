FactoryBot.define do
  factory :invoice_item do
    item { create(:item) }
    invoice { create(:invoice) }
    quantity { rand(1..10) }
    unit_price { rand(5.0..50.0) }
    created_at { '2018-09-01 12:00:00 UTC'}
    updated_at { '2018-09-01 12:00:00 UTC'}
  end
end
