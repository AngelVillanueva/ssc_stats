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
