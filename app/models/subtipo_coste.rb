# == Schema Information
#
# Table name: subtipos_coste
#
#  id          :integer          not null, primary key
#  descripcion :string(255)
#

class SubtipoCoste < ActiveRecord::Base
  has_many :tipos_coste_con_tarifa
  has_many :tipos_coste_sin_tarifa
  validates :descripcion, presence: true
  validates_uniqueness_of :descripcion, case_sensitive: false

  rails_admin do
    field :descripcion
  end
end
