# == Schema Information
#
# Table name: especialidades
#
#  id     :integer          not null, primary key
#  nombre :string(255)
#

class Especialidad < ActiveRecord::Base
  has_many :medicos
  validates :nombre, presence: true
  validates_uniqueness_of :nombre, case_sensitive: false
end
