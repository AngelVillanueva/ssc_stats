class ChangePreciosStamps < ActiveRecord::Migration
  def change
    drop_table :precios
    create_table :precios do |t|
      t.decimal :importe
      t.integer :vigencia
      t.boolean :incluido_en_forfait
      t.integer :compania_id
      t.integer :tipo_coste_con_tarifa_id

      t.timestamps
    end
  end
end
