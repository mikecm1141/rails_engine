class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.random
    order(Arel.sql('random()')).first
  end
end
