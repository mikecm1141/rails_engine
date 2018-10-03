require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Relationships' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
  end

  describe 'Class Methods' do
    context 'Finder Methods' do
      it '.random' do
        m1, m2, m3 = create_list(:item, 3)

        expect(Item.random).to be_a(Item)
      end
    end
  end
end
