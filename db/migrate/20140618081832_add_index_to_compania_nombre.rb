class AddIndexToCompaniaNombre < ActiveRecord::Migration
  def change
    add_index :companias, :nombre
  end
end
