class CreateDiagnosticos < ActiveRecord::Migration
  def change
    create_table :diagnosticos do |t|
      t.integer :episodio_id
      t.string :timestamps
    end
  end
end
