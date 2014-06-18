class ChangePreciosTable < ActiveRecord::Migration
  def change
    rename_column :precios, :forfait?, :is_in_forfait
  end
end
