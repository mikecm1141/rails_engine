require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many :items }
  it { should have_many :invoices }

  describe 'Class Methods' do
    it '.random' do
      m1, m2, m3 = create_list(:merchant, 3)

      expect(Merchant.random).to be_a(Merchant)
    end
  end
end
