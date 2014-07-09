class CodigoOmc < ActiveRecord::Base
  validates :codigo, :descripcion, presence: true
  validates :codigo, uniqueness: true

  rails_admin do
    list do
      field :id
      field :descripcion
      field :created_at
      field :updated_at
    end
  end
end