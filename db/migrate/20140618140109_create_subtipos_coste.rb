class CreateSubtiposCoste < ActiveRecord::Migration
  def change
    create_table :subtipos_coste do |t|
      t.string :descripcion
    end
  end
end
