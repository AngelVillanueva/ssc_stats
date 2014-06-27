class ChangeEstanciasStamps < ActiveRecord::Migration
  def change
    drop_table :estancias
    create_table :estancias do |t|
      t.integer :cantidad
      t.integer :episodio_id
      t.integer :tipo_coste_con_tarifa_id

      t.timestamps
    end
  end
end
