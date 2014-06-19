class Medico < ActiveRecord::Base
  has_many :episodios
  validates :nombre, :apellidos, presence: true

  def nombre_completo
    "#{nombre} #{apellidos}"
  end
end