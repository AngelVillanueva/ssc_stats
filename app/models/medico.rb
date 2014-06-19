class Medico < ActiveRecord::Base
  validates :nombre, :apellidos, presence: true

  def nombre_completo
    "#{nombre} #{apellidos}"
  end
end