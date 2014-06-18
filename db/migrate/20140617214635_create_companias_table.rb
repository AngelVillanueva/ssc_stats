class CreateCompaniasTable < ActiveRecord::Migration
  def change
    create_table :companias_tables do |t|
      t.string :nombre
    end
  end
end
