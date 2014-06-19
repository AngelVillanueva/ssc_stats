# == Schema Information
#
# Table name: episodios
#
#  id           :integer          not null, primary key
#  nhc          :integer
#  fecha_alta   :date
#  es_ambulante :boolean
#  compania_id  :integer
#  medico_id    :integer
#

class Episodio < ActiveRecord::Base
  belongs_to :compania
  belongs_to :medico
  has_one :especialidad, through: :medico
  validates :nhc, :fecha_alta, :compania, :medico, presence: true
  validates_numericality_of :nhc, greater_than_or_equal_to: 1
  validate :fecha_alta_range

  after_initialize do
    if new_record?
      self.es_ambulante ||= false
    end
  end

  def fecha_alta_range
    if fecha_alta && fecha_alta.year < 2000
      errors.add(:episodio, I18n.t( "errors.messages.too_old" ) )
    elsif fecha_alta && fecha_alta.year > 2030
      errors.add(:episodio, I18n.t( "errors.messages.too_new" ) )
    end
  end

  rails_admin do
    list do
      field :id
      field :fecha_alta
      field :nhc
      field :compania
      field :medico
      field :especialidad
      field :es_ambulante
    end
    edit do
      field :id
      field :fecha_alta
      field :nhc
      field :compania
      field :medico
      field :es_ambulante
    end
  end
end
