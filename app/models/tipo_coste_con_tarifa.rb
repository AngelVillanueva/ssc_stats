# == Schema Information
#
# Table name: tipos_coste_con_tarifa
#
#  id               :integer          not null, primary key
#  concepto         :string(255)
#  subtipo_coste_id :integer
#

class TipoCosteConTarifa < ActiveRecord::Base
  belongs_to :subtipo_coste
  has_many :precios
  validates :concepto, :subtipo_coste, presence: true
  validates_uniqueness_of :concepto, case_sensitive: false

  rails_admin do
    edit do
      field :concepto
      field :subtipo_coste
    end
  end
end
