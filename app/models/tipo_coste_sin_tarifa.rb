# == Schema Information
#
# Table name: tipos_coste_sin_tarifa
#
#  id               :integer          not null, primary key
#  concepto         :string(255)
#  subtipo_coste_id :integer
#

class TipoCosteSinTarifa < ActiveRecord::Base
  belongs_to :subtipo_coste
  validates :concepto, presence: true
  validates_uniqueness_of :concepto, case_sensitive: false
end
