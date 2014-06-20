class Estancia < ActiveRecord::Base
  belongs_to :episodio

  validates :episodio, presence: true
end