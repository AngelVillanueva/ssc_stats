class AddIndexVigenciaToPrecios < ActiveRecord::Migration
  def change
    add_index :precios, :vigencia
  end
end
