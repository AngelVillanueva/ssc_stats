class CreateEpisodios < ActiveRecord::Migration
  def change
    create_table :episodios do |t|
      t.integer :nhc
      t.date :fecha_alta
      t.boolean :es_ambulante
      t.integer :compania_id
      t.integer :medico_id
    end
  end
end
