FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    description { "Description of item." }
    unit_price { rand(5.0..50.0) }
    merchant { create(:merchant) }
    created_at { '2018-09-01 12:00:00 UTC'}
    updated_at { '2018-09-01 12:00:00 UTC'}
  end
end
