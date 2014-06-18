class ChangeForfaitColumnName < ActiveRecord::Migration
  def change
    rename_column :precios, :is_in_forfait, :incluido_en_forfait
  end
end
