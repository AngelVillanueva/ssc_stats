class ChangeMedicosStamps < ActiveRecord::Migration
  def change
    drop_table :medicos
    create_table :medicos do |t|
      t.string :nombre_pila
      t.string :apellidos
      t.integer :especialidad_id

      t.timestamps
    end
  end
end
