class CreateMedicos < ActiveRecord::Migration
  def change
    create_table :medicos do |t|
      t.string :nombre
      t.string :apellidos
      t.integer :especialidad_id
    end
  end
end
