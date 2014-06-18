class AddCompaniaidColumnToPrecios < ActiveRecord::Migration
  def change
    add_column :precios, :compania_id, :integer
  end
end
