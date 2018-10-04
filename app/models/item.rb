class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items

  default_scope { order(id: :asc) }

  def self.top_items_by_revenue(n = 5)
    unscoped
      .select("items.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS item_revenue")
      .joins(:invoice_items)
      .joins("JOIN invoices ON invoice_items.invoice_id = invoices.id")
      .joins("JOIN transactions ON transactions.invoice_id = invoices.id")
      .merge(Transaction.unscoped.successful)
      .order("item_revenue DESC")
      .group(:id)
      .limit(n)
  end

  def self.top_items_by_quantity(n = 5)
    unscoped
      .select("items.*, SUM(quantity) AS quantity_sold")
      .joins(:invoice_items)
      .joins("JOIN invoices ON invoice_items.invoice_id = invoices.id")
      .joins("JOIN transactions ON transactions.invoice_id = invoices.id")
      .merge(Transaction.unscoped.successful)
      .order("quantity_sold DESC")
      .group(:id)
      .limit(n)
  end

  def self.best_day(item_id)
    Invoice.unscoped
          .select("invoices.*, SUM(invoice_items.quantity) AS quantity_sold")
          .joins(:invoice_items, :transactions)
          .merge(Transaction.unscoped.successful)
          .where(invoice_items: { item_id: item_id })
          .group(:id)
          .order("quantity_sold DESC, created_at DESC")
          .limit(1)
          .first
          .created_at
  end
end
