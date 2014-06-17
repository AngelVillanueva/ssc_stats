class Precio < ActiveRecord::Base
  validates_numericality_of :importe, greater_than_or_equal_to: 0
  validates_numericality_of :vigencia, greater_than_or_equal_to: 2000
  validates_numericality_of :vigencia, less_than_or_equal_to: 2030

  rails_admin do
    configure :importe do
      pretty_value do
        ActionController::Base.helpers.number_to_currency(value)
      end
    end
  end
end