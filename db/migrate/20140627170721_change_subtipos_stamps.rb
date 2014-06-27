class ChangeSubtiposStamps < ActiveRecord::Migration
  def change
    drop_table :subtipos_coste
    create_table :subtipos_coste do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
