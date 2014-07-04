class CreateDiagnosticosConStamps < ActiveRecord::Migration
  def change
    create_table :diagnosticos do |t|
      t.integer :episodio_id

      t.timestamps
    end
    add_index :diagnosticos, :episodio_id
  end
end
