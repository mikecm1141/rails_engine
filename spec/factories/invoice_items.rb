FactoryBot.define do
  factory :invoice_item do
    item { create(:item) }
    invoice { create(:invoice) }
    quantity { rand(1..10) }
    unit_price { rand(5.0..50.0) }
  end
end
