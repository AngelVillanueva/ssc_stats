# == Schema Information
#
# Table name: codigos_omc
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  descripcion :string(255)
#  codigo      :integer
#

class CodigoOmc < ActiveRecord::Base
  has_many :diagnosticos
  belongs_to :grupo_quirurgico
  validates :codigo, :descripcion, :grupo_quirurgico, presence: true
  validates :codigo, uniqueness: true

  rails_admin do
    list do
      field :id
      field :descripcion
      field :diagnosticos
      field :grupo_quirurgico
      field :created_at
      field :updated_at
    end
  end
end
