class CreateCodigosOmc < ActiveRecord::Migration
  def change
    create_table :codigos_omc do |t|
      t.timestamps
    end
  end
end
