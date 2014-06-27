class ChangeCsvFiles < ActiveRecord::Migration
  def change
    drop_table :csv_files
    create_table :csv_files do |t|
      t.string :nombre
      t.attachment :csv_file_archivo

      t.timestamps
    end
  end
end
