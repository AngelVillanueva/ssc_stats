# == Schema Information
#
# Table name: diagnosticos
#
#  id          :integer          not null, primary key
#  episodio_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Diagnostico < ActiveRecord::Base
  belongs_to :episodio
  belongs_to :tipo_coste_con_tarifa
  belongs_to :codigo_omc

  validates_with TipoValidator, nombres: %w( Diagnóstico Quirófano Quirofano ) # check that the TipoCoste fits the Subtipo
end
