require 'spec_helper'

describe TipoCosteSinTarifa do
  it { should respond_to :concepto }
  it { should belong_to :subtipo_coste }

  it { should validate_presence_of :concepto }
  it { should validate_uniqueness_of :concepto }
  it { should validate_presence_of :subtipo_coste }
  
  describe "should validate concepto uniqueness in a non case sensitive way" do
    let( :subtipo ) { FactoryGirl.create( :subtipo_coste ) }
    let( :concepto_coste ) { FactoryGirl.create( :tipo_coste_sin_tarifa, subtipo_coste: subtipo ) }
    let( :concepto_coste_2 ) { FactoryGirl.create( :tipo_coste_sin_tarifa, concepto: "Otro", subtipo_coste: subtipo ) }
    let( :concepto_nombre ) { concepto_coste.concepto.downcase }
    before { concepto_coste_2.concepto = concepto_nombre }
    subject { concepto_coste_2 }
    it { should_not be_valid }
  end
end