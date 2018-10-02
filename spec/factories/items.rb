FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    description { "Description of item." }
    unit_price { rand(5.0..50.0) }
    merchant { create(:merchant) }
  end
end
