class CreateGruposQuirurgicos < ActiveRecord::Migration
  def change
    create_table :grupos_quirurgicos do |t|
      t.timestamps
    end
  end
end
