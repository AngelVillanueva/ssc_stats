class ChangeCompaniasTimestamps < ActiveRecord::Migration
  def change
    drop_table :companias
    create_table :companias do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
