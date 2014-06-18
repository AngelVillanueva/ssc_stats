class TipoCosteConTarifa < ActiveRecord::Base
  has_many :precios
end