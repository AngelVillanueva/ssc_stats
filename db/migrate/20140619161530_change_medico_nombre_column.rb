class ChangeMedicoNombreColumn < ActiveRecord::Migration
  def change
    rename_column :medicos, :nombre, :nombre_pila
  end
end
