FactoryBot.define do
  factory :merchant do
    sequence(:name) { |n| "Merchant #{n}" }
    created_at { '2018-09-01 12:00:00 UTC' }
    updated_at { '2018-09-01 12:00:00 UTC' }
  end
end
