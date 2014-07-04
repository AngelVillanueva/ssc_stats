class CodigoOmc < ActiveRecord::Base
  rails_admin do
    list do
      field :id
      field :descripcion
      field :created_at
      field :updated_at
    end
  end
end