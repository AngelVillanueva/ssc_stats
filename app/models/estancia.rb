class Estancia < ActiveRecord::Base
  belongs_to :episodio
  belongs_to :tipo_coste_con_tarifa

  validates :cantidad, :episodio, :tipo_coste_con_tarifa, presence: true
  validates_numericality_of :cantidad, greater_than_or_equal_to: 1
  validate :tipo_valido

  def tipo_valido
    unless tipo_coste_con_tarifa.nil?
      subtipo = tipo_coste_con_tarifa.subtipo_coste.descripcion
      unless subtipo === "Estancia"
        errors.add(:tipo_coste_con_tarifa, I18n.t( "errors.messages.bad_tipo_coste" ) )
      end
    end
  end
end