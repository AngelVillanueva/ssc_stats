class CreateEstancias < ActiveRecord::Migration
  def change
    create_table :estancias do |t|
      t.integer :cantidad
      t.integer :episodio_id
      t.integer :tipo_coste_con_tarifa_id
    end
  end
end
