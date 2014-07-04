class RemoveDiagnosticos < ActiveRecord::Migration
  def change
    drop_table :diagnosticos
  end
end
