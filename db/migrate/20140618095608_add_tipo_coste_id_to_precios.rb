class AddTipoCosteIdToPrecios < ActiveRecord::Migration
  def change
    add_column :precios, :tipo_coste_con_tarifa_id, :integer
  end
end
