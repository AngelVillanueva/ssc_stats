# == Schema Information
#
# Table name: especialidades
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Especialidad < ActiveRecord::Base
  include Shared::Import
  has_many :medicos
  validates :nombre, presence: true
  validates_uniqueness_of :nombre, case_sensitive: false
end
