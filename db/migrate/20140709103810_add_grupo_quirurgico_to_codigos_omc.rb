class AddGrupoQuirurgicoToCodigosOmc < ActiveRecord::Migration
  def change
    add_column :codigos_omc, :grupo_quirurgico_id, :integer
  end
end
