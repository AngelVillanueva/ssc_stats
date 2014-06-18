class SubtipoCoste < ActiveRecord::Base
  has_many :tipos_coste_con_tarifa
  validates :descripcion, presence: true
  validates_uniqueness_of :descripcion, case_sensitive: false

  rails_admin do
    field :descripcion
  end
end