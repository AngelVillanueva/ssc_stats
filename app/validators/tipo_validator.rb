# valida que el tipo de coste de una línea de coste sea del mismo subtipo que la propia línea
# comprueba que el tipo sea del mismo subtipo que el nombre de Clase de la línea o del nombre(s) que se le pase como opción
class TipoValidator < ActiveModel::Validator
  def validate(record)
    unless record.tipo_coste_con_tarifa.nil?
      # subtipo con el que ha de concordar
      subtipo = record.tipo_coste_con_tarifa.subtipo_coste.descripcion
      # matriz con la que comparar, compuesta por la Clase y los nombres que se pasen, si hay
      nombres = options[:nombres].push record.class.to_s
      unless nombres.include? subtipo
        record.errors.add(:tipo_coste_con_tarifa, I18n.t( "errors.messages.bad_tipo_coste" ) )
      end
    end
  end
end