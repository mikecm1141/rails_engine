class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices
  
  default_scope { order(id: :asc) }

  def favorite_merchant
    Merchant
      .unscoped
      .select("merchants.*, COUNT(invoices.id) AS invoice_count")
      .joins(invoices: :transactions)
      .where(invoices: { customer: self })
      .merge(Transaction.unscoped.successful)
      .group(:id).order("invoice_count DESC")
      .limit(1)
      .first
  end
end
