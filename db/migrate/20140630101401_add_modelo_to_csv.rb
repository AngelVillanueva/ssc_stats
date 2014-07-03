class AddModeloToCsv < ActiveRecord::Migration
  def change
    add_column :csv_files, :modelo, :string
  end
end
