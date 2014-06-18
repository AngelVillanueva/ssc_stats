class SubtipoCoste < ActiveRecord::Base
  has_many :tipos_coste_con_tarifa
end