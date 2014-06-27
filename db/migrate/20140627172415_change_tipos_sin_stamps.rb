class ChangeTiposSinStamps < ActiveRecord::Migration
  def change
    drop_table :tipos_coste_sin_tarifa
    create_table :tipos_coste_sin_tarifa do |t|
      t.string :concepto
      t.integer :subtipo_coste_id

      t.timestamps
    end
  end
end
