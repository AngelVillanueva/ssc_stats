require 'spec_helper'

describe SubtipoCoste do
  it { should respond_to :tipos_coste_con_tarifa }

  it { should validate_presence_of :descripcion }
  it { should validate_uniqueness_of :descripcion }
  # describe "should validate descripcion uniqueness in a non case sensitive way" do
  #   let( :concepto_coste ) { FactoryGirl.create( :tipo_coste_con_tarifa ) }
  #   let( :concepto_coste_2 ) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Otro" ) }
  #   let( :concepto_nombre ) { concepto_coste.concepto.downcase }
  #   before { concepto_coste_2.concepto = concepto_nombre }
  #   subject { concepto_coste_2 }
  #   it { should_not be_valid }
  # end
end