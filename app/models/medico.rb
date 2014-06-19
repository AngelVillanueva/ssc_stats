class Medico < ActiveRecord::Base
  belongs_to :especialidad
  has_many :episodios
  validates :nombre, :apellidos, :especialidad, presence: true

  def nombre_completo
    "#{nombre} #{apellidos}"
  end

  rails_admin do
    edit do
      field :nombre
      field :apellidos
      field :especialidad
    end
  end
end