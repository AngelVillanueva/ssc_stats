class AddIndexForSubtipoDescripcion < ActiveRecord::Migration
  def change
    add_index :subtipos_coste, :descripcion
  end
end
