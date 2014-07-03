class RemoveModeloFromCsvFile < ActiveRecord::Migration
  def change
    remove_column :csv_files, :modelo
  end
end
