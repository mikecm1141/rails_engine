class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.random
    Merchant.order(Arel.sql('random()')).first
  end
end
