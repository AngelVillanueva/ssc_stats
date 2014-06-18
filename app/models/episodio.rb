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
  validates :nhc, :fecha_alta, presence: true
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
end
