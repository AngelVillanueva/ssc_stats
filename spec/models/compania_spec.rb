# == Schema Information
#
# Table name: companias
#
#  id     :integer          not null, primary key
#  nombre :string(255)
#

require 'spec_helper'


describe Compania do
  it { should respond_to :nombre }

  it { should have_many :precios }
  it { should have_many :episodios }

  it { should validate_presence_of :nombre }
  it { should validate_uniqueness_of :nombre }

  describe "should validate nombre uniqueness in a non case sensitive way" do
    let( :compania ) { FactoryGirl.create( :compania ) }
    let( :compania_2 ) { FactoryGirl.create( :compania, nombre: "Otro" ) }
    let( :compania_nombre ) { compania.nombre.downcase }
    before { compania_2.nombre = compania_nombre }
    subject { compania_2 }
    it { should_not be_valid }
  end
end
