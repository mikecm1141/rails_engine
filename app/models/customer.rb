class Customer < ApplicationRecord
  has_many :invoices
  
  default_scope { order(id: :asc) }
end
