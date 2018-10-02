FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    description { "Description of item." }
    unit_price { rand(500..50000) }
    merchant { create(:merchant) }
  end
end
