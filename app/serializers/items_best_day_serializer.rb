class ItemsBestDaySerializer < ActiveModel::Serializer
  attributes :best_day

  def best_day
    object
  end
end
