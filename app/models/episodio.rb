# == Schema Information
#
# Table name: episodios
#
#  id           :integer          not null, primary key
#  nhc          :integer
#  fecha_alta   :date
#  es_ambulante :boolean
#  compania_id  :integer
#  medico_id    :integer
#

class Episodio < ActiveRecord::Base
end
