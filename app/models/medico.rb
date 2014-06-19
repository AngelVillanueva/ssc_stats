class Medico < ActiveRecord::Base
  belongs_to :especialidad
  has_many :episodios
  validates :nombre_pila, :apellidos, :especialidad, presence: true

  def nombre_completo
    "#{nombre_pila} #{apellidos}"
  end

  rails_admin do
    edit do
      field :nombre_pila
      field :apellidos
      field :especialidad
    end
  end
end