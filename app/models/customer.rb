class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  
  default_scope { order(id: :asc) }
end
