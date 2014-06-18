class AddSubtipoCosteIdToTipos < ActiveRecord::Migration
  def change
    add_column :tipos_coste_con_tarifa, :subtipo_coste_id, :integer
  end
end
