class GrupoQuirurgico < ActiveRecord::Base
  validates :nombre, presence: true, uniqueness: true

  rails_admin do
    list do
      field :id
      field :nombre
      field :codigos_omc
      field :created_at
      field :updated_at
    end
  end
end