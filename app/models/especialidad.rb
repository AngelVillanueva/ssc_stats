class Especialidad < ActiveRecord::Base
  validates :nombre, presence: true
  validates_uniqueness_of :nombre, case_sensitive: false
end