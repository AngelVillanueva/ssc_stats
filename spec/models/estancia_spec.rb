require 'spec_helper'

describe Estancia do
  it { should respond_to :cantidad }

  it { should belong_to :episodio }
  it { should belong_to :tipo_coste_con_tarifa }

  it { should validate_presence_of :cantidad }
  it { should validate_presence_of :episodio }
  it { should validate_presence_of :tipo_coste_con_tarifa }
  it { should validate_numericality_of( :cantidad ).is_greater_than_or_equal_to( 1 ) }

  describe "with a valid TipoCoste" do
    let(:subtipo) { FactoryGirl.create( :subtipo_coste, descripcion: "Estancia" ) }
    let(:tipo_coste) { FactoryGirl.create( :tipo_coste_con_tarifa, subtipo_coste: subtipo ) }
    let(:tipo_coste_2) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Otro" ) }
    let(:episodio) { FactoryGirl.create( :episodio ) }
    let(:estancia ) { FactoryGirl.create( :estancia, tipo_coste_con_tarifa: tipo_coste ) }
    subject { estancia }
    before { estancia.tipo_coste_con_tarifa = tipo_coste_2 }
    it { should_not be_valid }
  end
end