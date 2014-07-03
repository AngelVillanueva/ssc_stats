# == Schema Information
#
# Table name: tipos_coste_sin_tarifa
#
#  id               :integer          not null, primary key
#  concepto         :string(255)
#  subtipo_coste_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class TipoCosteSinTarifa < ActiveRecord::Base
  belongs_to :subtipo_coste
  validates :concepto, :subtipo_coste, presence: true
  validates_uniqueness_of :concepto, case_sensitive: false
end
