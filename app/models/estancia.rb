class Estancia < ActiveRecord::Base
  belongs_to :episodio

  validates :cantidad, :episodio, presence: true
  validates_numericality_of :cantidad, greater_than_or_equal_to: 1
end