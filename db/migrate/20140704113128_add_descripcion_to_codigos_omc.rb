class AddDescripcionToCodigosOmc < ActiveRecord::Migration
  def change
    add_column :codigos_omc, :descripcion, :string
  end
end
