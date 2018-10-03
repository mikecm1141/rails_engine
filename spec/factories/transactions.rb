FactoryBot.define do
  factory :transaction do
    invoice { create(:invoice) }
    credit_card_number { "5939305920395032" }
    credit_card_expiration_date { "0920" }
    result { %w[success failed].sample }
    created_at { '2018-09-01 12:00:00 UTC' }
    updated_at { '2018-09-01 12:00:00 UTC' }
  end
end
