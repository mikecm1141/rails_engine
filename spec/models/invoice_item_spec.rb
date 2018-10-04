require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'Relationships' do
    it { should belong_to :invoice }
    it { should belong_to :item }
  end

  describe 'Class Methods' do
    context 'Finder Methods' do
      it '.random' do
        invoice_item1, invoice_item2, invoice_item3 = create_list(:invoice_item, 3)

        expect(InvoiceItem.random).to be_a(InvoiceItem)
      end
    end
  end
end
