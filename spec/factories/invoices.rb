FactoryBot.define do
  factory :invoice do
    customer { create(:customer) }
    merchant { create(:merchant) }
    status { 'shipped' }
    created_at { '2018-09-01 12:00:00 UTC'}
    updated_at { '2018-09-01 12:00:00 UTC'}
  end
end
