# == Schema Information
#
# Table name: tipos_coste_con_tarifa
#
#  id       :integer          not null, primary key
#  concepto :string(255)
#

require 'spec_helper'

describe TipoCosteConTarifa do
  it { should respond_to :precios }
  it { should validate_presence_of :concepto }
  it { should validate_uniqueness_of :concepto }

  describe "should validate concepto uniqueness in a non case sensitive way" do
    let( :concepto_coste ) { FactoryGirl.create( :tipo_coste_con_tarifa ) }
    let( :concepto_coste_2 ) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Otro" ) }
    let( :concepto_nombre ) { concepto_coste.concepto.downcase }
    before { concepto_coste_2.concepto = concepto_nombre }
    subject { concepto_coste_2 }
    it { should_not be_valid }
  end
end
