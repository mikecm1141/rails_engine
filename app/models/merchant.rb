class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  default_scope { order(id: :asc) }

  def self.random
    order(Arel.sql('random()')).first
  end

  def self.top_merchants_by_revenue(n = 5)
    unscoped
      .select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue_total")
      .joins(invoices: %i[invoice_items transactions])
      .merge(Transaction.unscoped.successful)
      .group(:id)
      .order("revenue_total DESC")
      .limit(n)
  end

  def self.most_items(n = 5)
    unscoped
      .select("merchants.*, SUM(invoice_items.quantity) AS item_count")
      .joins(invoices: %i[invoice_items transactions])
      .merge(Transaction.unscoped.successful)
      .group(:id)
      .order("item_count DESC")
      .limit(n)
  end

  def self.total_revenue_by_date(date)
    joins(invoices: %i[invoice_items transactions])
      .merge(Transaction.unscoped.successful)
      .where(invoices: {updated_at: date.to_date.beginning_of_day..date.to_date.end_of_day})
      .sum('quantity * unit_price')
  end

  def total_revenue(parameter = nil)
    Merchant.unscoped
          .joins(invoices: %i[invoice_items transactions])
          .where(invoices: { merchant: self })
          .where(parameter)
          .merge(Transaction.unscoped.successful)
          .sum('quantity * unit_price')
  end
end