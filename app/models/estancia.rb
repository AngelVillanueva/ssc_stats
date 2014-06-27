# == Schema Information
#
# Table name: estancias
#
#  id                       :integer          not null, primary key
#  cantidad                 :integer
#  episodio_id              :integer
#  tipo_coste_con_tarifa_id :integer
#

class Estancia < ActiveRecord::Base
  belongs_to :episodio
  belongs_to :tipo_coste_con_tarifa

  validates :cantidad, :episodio, :tipo_coste_con_tarifa, presence: true
  validates_numericality_of :cantidad, greater_than_or_equal_to: 1
  validates_with TipoValidator, nombres: [] # check that the TipoCoste fits the Subtipo
end
