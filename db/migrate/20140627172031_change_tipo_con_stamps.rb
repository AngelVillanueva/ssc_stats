class ChangeTipoConStamps < ActiveRecord::Migration
  def change
    drop_table :tipos_coste_con_tarifa
    create_table :tipos_coste_con_tarifa do |t|
      t.string :concepto
      t.integer :subtipo_coste_id

      t.timestamps
    end
  end
end
