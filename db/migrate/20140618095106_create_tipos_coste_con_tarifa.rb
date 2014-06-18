class CreateTiposCosteConTarifa < ActiveRecord::Migration
  def change
    create_table :tipos_coste_con_tarifa do |t|
      t.string :concepto
    end
  end
end
