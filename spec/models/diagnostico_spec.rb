# == Schema Information
#
# Table name: diagnosticos
#
#  id          :integer          not null, primary key
#  episodio_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'


describe Diagnostico do
  it { should belong_to :episodio }
  it { should belong_to :tipo_coste_con_tarifa }

  describe "with a valid TipoCoste should be valid" do
    let(:subtipo) { FactoryGirl.create( :subtipo_coste, descripcion: "Diagnostico" ) }
    let(:tipo_coste) { FactoryGirl.create( :tipo_coste_con_tarifa, subtipo_coste: subtipo ) }
    let(:episodio) { FactoryGirl.create( :episodio ) }
    let(:diagnostico ) { FactoryGirl.create( :diagnostico, tipo_coste_con_tarifa: tipo_coste ) }
    subject { diagnostico }
    it { should be_valid }
  end
  describe "with a valid TipoCoste should be valid" do
    let(:subtipo) { FactoryGirl.create( :subtipo_coste, descripcion: "Diagnóstico" ) }
    let(:tipo_coste) { FactoryGirl.create( :tipo_coste_con_tarifa, subtipo_coste: subtipo ) }
    let(:episodio) { FactoryGirl.create( :episodio ) }
    let(:diagnostico ) { FactoryGirl.create( :diagnostico, tipo_coste_con_tarifa: tipo_coste ) }
    subject { diagnostico }
    it { should be_valid }
  end
  describe "with a valid TipoCoste should be valid" do
    let(:subtipo) { FactoryGirl.create( :subtipo_coste, descripcion: "Quirófano" ) }
    let(:tipo_coste) { FactoryGirl.create( :tipo_coste_con_tarifa, subtipo_coste: subtipo ) }
    let(:episodio) { FactoryGirl.create( :episodio ) }
    let(:diagnostico ) { FactoryGirl.create( :diagnostico, tipo_coste_con_tarifa: tipo_coste ) }
    subject { diagnostico }
    it { should be_valid }
  end
  describe "with a valid TipoCoste should be valid" do
    let(:subtipo) { FactoryGirl.create( :subtipo_coste, descripcion: "Quirofano" ) }
    let(:tipo_coste) { FactoryGirl.create( :tipo_coste_con_tarifa, subtipo_coste: subtipo ) }
    let(:episodio) { FactoryGirl.create( :episodio ) }
    let(:diagnostico ) { FactoryGirl.create( :diagnostico, tipo_coste_con_tarifa: tipo_coste ) }
    subject { diagnostico }
    it { should be_valid }
  end
  describe "with an invalid TipoCoste should not be valid" do
    let(:subtipo) { FactoryGirl.create( :subtipo_coste, descripcion: "Diagnostico" ) }
    let(:tipo_coste) { FactoryGirl.create( :tipo_coste_con_tarifa, subtipo_coste: subtipo ) }
    let(:tipo_coste_2) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Otro" ) }
    let(:episodio) { FactoryGirl.create( :episodio ) }
    let(:diagnostico ) { FactoryGirl.create( :diagnostico, tipo_coste_con_tarifa: tipo_coste ) }
    subject { diagnostico }
    before { diagnostico.tipo_coste_con_tarifa = tipo_coste_2 }
    it { should_not be_valid }
  end
end
