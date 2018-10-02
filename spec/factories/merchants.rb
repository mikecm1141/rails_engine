FactoryBot.define do
  factory :merchant do
    sequence(:name) { |n| "Merchant #{n}" }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
