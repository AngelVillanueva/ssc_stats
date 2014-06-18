class CreateTableCompanias < ActiveRecord::Migration
  def change
    create_table :companias do |t|
      t.string :nombre
    end
  end
end
