# == Schema Information
#
# Table name: companias
#
#  id     :integer          not null, primary key
#  nombre :string(255)
#

class Compania < ActiveRecord::Base
  has_many :precios
  validates :nombre, presence: true
end
