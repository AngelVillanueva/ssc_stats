class Precio < ActiveRecord::Base
  validates_numericality_of :vigencia, greater_than_or_equal_to: 2000
  validates_numericality_of :vigencia, less_than_or_equal_to: 2030
end