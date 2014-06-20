class Especialidad < ActiveRecord::Base
  has_many :medicos
  validates :nombre, presence: true
  validates_uniqueness_of :nombre, case_sensitive: false
end