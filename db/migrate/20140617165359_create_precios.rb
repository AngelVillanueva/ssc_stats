class CreatePrecios < ActiveRecord::Migration
  def change
    create_table :precios do |t|
      t.decimal :importe
      t.integer :vigencia
      t.boolean :forfait?
    end
  end
end
