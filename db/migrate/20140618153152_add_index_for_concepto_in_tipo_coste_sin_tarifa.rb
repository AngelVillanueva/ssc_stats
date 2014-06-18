class AddIndexForConceptoInTipoCosteSinTarifa < ActiveRecord::Migration
  def change
    add_index :tipos_coste_sin_tarifa, :concepto
  end
end
