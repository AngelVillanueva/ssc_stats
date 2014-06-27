# == Schema Information
#
# Table name: subtipos_coste
#
#  id          :integer          not null, primary key
#  descripcion :string(255)
#

class SubtipoCoste < ActiveRecord::Base
  has_many :tipo_coste_con_tarifas
  has_many :tipo_coste_sin_tarifas
  validates :descripcion, presence: true
  validates_uniqueness_of :descripcion, case_sensitive: false

end
