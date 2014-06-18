class TipoCosteConTarifa < ActiveRecord::Base
  has_many :precios
  validates :concepto, presence: true
  validates_uniqueness_of :concepto, case_sensitive: false

  rails_admin do
    edit do
      field :concepto
    end
  end
end