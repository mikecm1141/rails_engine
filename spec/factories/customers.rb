FactoryBot.define do
  factory :customer do
    sequence(:first_name) { |n| "First Name #{n}" }
    sequence(:last_name) { |n| "Last Name #{n}" }
    created_at { '2018-09-01 12:00:00 UTC' }
    updated_at { '2018-09-01 12:00:00 UTC' }
  end
end
