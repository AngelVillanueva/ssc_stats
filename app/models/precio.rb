# == Schema Information
#
# Table name: precios
#
#  id                  :integer          not null, primary key
#  importe             :decimal(, )
#  vigencia            :integer
#  incluido_en_forfait :boolean
#  compania_id         :integer
#

class Precio < ActiveRecord::Base
  belongs_to :compania
  validates_numericality_of :importe, greater_than_or_equal_to: 0
  validates_numericality_of :vigencia, greater_than_or_equal_to: 2000
  validates_numericality_of :vigencia, less_than_or_equal_to: 2030
  validates :importe, :vigencia, :compania, presence: true

  after_initialize do
    if new_record?
      self.incluido_en_forfait ||= true
    end
  end

  rails_admin do
    # sorting the fields
    field :importe
    field :vigencia
    field :compania
    field :incluido_en_forfait
    # extended options
    configure :importe do
      pretty_value do
        ActionController::Base.helpers.number_to_currency(value)
      end
      help I18n.t("activerecord.attributes.precio.importe_help")
    end
    configure :vigencia do
      help I18n.t("activerecord.attributes.precio.vigencia_help")
    end
    configure :incluido_en_forfait do
      help I18n.t("activerecord.attributes.precio.incluido_en_forfait_help")
    end
  end
  
end
