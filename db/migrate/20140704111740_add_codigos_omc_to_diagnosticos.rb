class AddCodigosOmcToDiagnosticos < ActiveRecord::Migration
  def change
    add_column :diagnosticos, :codigo_omc_id, :integer
    add_index :diagnosticos, :codigo_omc_id
  end
end
