class CreateTiposCosteSinTarifa < ActiveRecord::Migration
  def change
    create_table :tipos_coste_sin_tarifa do |t|
      t.string :concepto
      t.integer :subtipo_coste_id
    end
  end
end
