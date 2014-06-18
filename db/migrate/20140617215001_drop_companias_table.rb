class DropCompaniasTable < ActiveRecord::Migration
  def change
    drop_table :companias_tables
  end
end
