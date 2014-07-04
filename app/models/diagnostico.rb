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
end
