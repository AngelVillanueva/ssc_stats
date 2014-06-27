class ChangeEpisodioStamps < ActiveRecord::Migration
  def change
    drop_table :episodios
    create_table :episodios do |t|
      t.integer :nhc
      t.date :fecha_alta
      t.boolean :es_ambulante
      t.integer :compania_id
      t.integer :medico_id

      t.timestamps
    end
  end
end
