class TipoCosteSinTarifa < ActiveRecord::Base
  belongs_to :subtipo_coste
  validates :concepto, presence: true
  validates_uniqueness_of :concepto, case_sensitive: false
end