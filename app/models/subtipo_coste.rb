class SubtipoCoste < ActiveRecord::Base
  has_many :tipos_coste_con_tarifa

  rails_admin do
    field :descripcion
  end
end