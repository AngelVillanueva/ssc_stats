class AddCodigoToCodigosOmc < ActiveRecord::Migration
  def change
    add_column :codigos_omc, :codigo, :integer
  end
end
