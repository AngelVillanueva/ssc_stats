# == Schema Information
#
# Table name: companias
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Compania < ActiveRecord::Base
  has_many :precios
  has_many :episodios
  validates :nombre, presence: true
  validates_uniqueness_of :nombre, case_sensitive: false

  rails_admin do
    edit do
      field :nombre
    end
  end
end
