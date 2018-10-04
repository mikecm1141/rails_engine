require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Relationships' do
    it { should have_many :invoices }
  end

  describe 'Business Logic' do
    describe 'Instance Methods' do
      it '#favorite_merchant' do
        customer = create(:customer)
        merchant1, merchant2 = create_list(:merchant, 2)

        # Merchant 1 Transactions
        invoice1, invoice2 = create_list(:invoice, 2, customer: customer, merchant: merchant1)
        create(:transaction, invoice: invoice1, result: 'success')
        create(:transaction, invoice: invoice2, result: 'success')

        # Merchant 2 Transaction
        invoice3 = create(:invoice, merchant: merchant2)
        create(:transaction, invoice: invoice3, result: 'success')

        expect(Customer.favorite_merchant(customer.id)).to eq(merchant1)
      end
    end
  end
end
