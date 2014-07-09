class AddCodeIndexToCodigosOmc < ActiveRecord::Migration
  def change
    add_index :codigos_omc, :codigo
  end
end
