class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items

  default_scope { order(id: :asc) }

  def self.random
    order(Arel.sql('random()')).first
  end
end
