class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def self.random
    Merchant.order(Arel.sql('random()')).first
  end

  def self.top_merchants_by_revenue(n)
    Merchant.select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue_total")
            .joins("JOIN invoices ON merchants.id = invoices.merchant_id")
            .joins("JOIN invoice_items ON invoices.id = invoice_items.invoice_id")
            .joins("JOIN transactions ON invoices.id = transactions.invoice_id")
            .where("transactions.result = ?", "success")
            .group("merchants.id")
            .order("revenue_total DESC")
            .limit(n)
  end
end
