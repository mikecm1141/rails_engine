require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'Relationships' do
    it { should belong_to :merchant }
    it { should belong_to :customer }
    it { should have_many :invoice_items }
    it { should have_many :transactions }
  end

  describe 'Class Methods' do
    context 'Finder Methods' do
      it '.random' do
        m1, m2, m3 = create_list(:invoice, 3)

        expect(Invoice.random).to be_a(Invoice)
      end
    end
  end
end
