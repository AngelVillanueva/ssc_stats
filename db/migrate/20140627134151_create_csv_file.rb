class CreateCsvFile < ActiveRecord::Migration
  def change
    create_table :csv_files do |t|
      t.attachment :archivo

      t.timestamps
    end
  end
end
