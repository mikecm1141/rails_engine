class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  default_scope { order(id: :asc) }

  def self.customers_with_pending_invoices(merchant_id)
    Customer.find_by_sql("SELECT customers.* FROM customers 
      INNER JOIN invoices ON customers.id=invoices.customer_id 
      INNER JOIN transactions ON transactions.invoice_id=invoices.id 
      INNER JOIN merchants ON merchants.id=invoices.merchant_id 
      WHERE merchants.id=#{merchant_id} AND transactions.result='failed'
      EXCEPT 
      SELECT customers.* FROM customers 
      INNER JOIN invoices ON customers.id=invoices.customer_id 
      INNER JOIN transactions ON transactions.invoice_id=invoices.id 
      INNER JOIN merchants ON merchants.id=invoices.merchant_id 
      WHERE merchants.id=#{merchant_id} AND transactions.result='success'")
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

  def self.total_revenue(merchant_id, parameter = nil)
    Merchant.unscoped
          .joins(invoices: %i[invoice_items transactions])
          .where(invoices: { merchant_id: merchant_id })
          .where(parameter)
          .merge(Transaction.unscoped.successful)
          .sum('quantity * unit_price')
  end

  def self.favorite_customer(merchant_id)
    Customer.unscoped
          .select("customers.*, COUNT(invoices.id) AS order_count")
          .joins(invoices: :transactions)
          .where(invoices: { merchant_id: merchant_id })
          .merge(Transaction.unscoped.successful)
          .group(:id)
          .order("order_count DESC")
          .limit(1)
          .first
  end
end