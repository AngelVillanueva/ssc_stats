class AddNombreToGrupoQuirurgico < ActiveRecord::Migration
  def change
    add_column :grupos_quirurgicos, :nombre, :string
    add_index :grupos_quirurgicos, :nombre
  end
end
