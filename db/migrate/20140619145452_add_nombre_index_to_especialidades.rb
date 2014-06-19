class AddNombreIndexToEspecialidades < ActiveRecord::Migration
  def change
    add_index :especialidades, :nombre
  end
end
