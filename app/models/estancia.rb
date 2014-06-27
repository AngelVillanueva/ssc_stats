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

  validates :cantidad, :episodio, :tipo_coste_con_tarifa, :tipo_coste_con_tarifa_id, presence: true
  validates_numericality_of :cantidad, greater_than_or_equal_to: 1
  validates_with TipoValidator, nombres: [] # check that the TipoCoste fits the Subtipo

  def valid_tipos
    tipos_validos = self.class.to_s.split
    valid_subtipo = SubtipoCoste.where("descripcion IN (?)", tipos_validos).to_a.first
    TipoCosteConTarifa.where(subtipo_coste: valid_subtipo).map { |t| [t.concepto, t.id]}
  end

  rails_admin do
    edit do
      field :cantidad
      field :episodio
      field :tipo_coste_con_tarifa_id, :enum do
        enum do
          #ActiveRecord query to limit selectable Tipos de Coste
          valid_tipos = bindings[:object].class.to_s.split # valid tipo is just the subtipo matching the Class
          valid_subtipo = SubtipoCoste.where("descripcion IN (?)", valid_tipos).to_a.first
          unless valid_subtipo.nil?
            TipoCosteConTarifa.where(subtipo_coste: valid_subtipo).map { |t| [ t.concepto, t.id ] }
          else
            ''
          end
        end
      end
    end
  end
end
