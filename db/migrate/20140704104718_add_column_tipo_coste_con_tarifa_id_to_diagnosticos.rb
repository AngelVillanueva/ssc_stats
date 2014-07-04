class AddColumnTipoCosteConTarifaIdToDiagnosticos < ActiveRecord::Migration
  def change
    add_column :diagnosticos, :tipo_coste_con_tarifa_id, :integer
    add_index :diagnosticos, :tipo_coste_con_tarifa_id
  end
end
