class ChangeEspecialidadStamps < ActiveRecord::Migration
  def change
    drop_table :especialidades
    create_table :especialidades do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
