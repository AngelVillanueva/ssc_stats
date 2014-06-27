class CreateCsvFilesTable < ActiveRecord::Migration
  def change
    create_table :csv_files do |t|
      t.string :nombre
    end
  end
end
