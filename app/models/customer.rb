class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices
  
  default_scope { order(id: :asc) }

  def self.favorite_merchant(customer_id)
    Merchant
      .unscoped
      .select("merchants.*, COUNT(invoices.id) AS invoice_count")
      .joins(invoices: :transactions)
      .where(invoices: { customer_id: customer_id })
      .merge(Transaction.unscoped.successful)
      .group(:id).order("invoice_count DESC")
      .limit(1)
      .first
  end
end
