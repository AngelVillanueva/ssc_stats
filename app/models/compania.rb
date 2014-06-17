class Compania < ActiveRecord::Base
  has_many :precios
  validates :nombre, presence: true
end