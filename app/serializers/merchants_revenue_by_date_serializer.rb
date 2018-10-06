class MerchantsRevenueByDateSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    '%.2f' % object
  end
end
