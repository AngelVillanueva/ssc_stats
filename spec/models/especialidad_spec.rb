# == Schema Information
#
# Table name: especialidades
#
#  id     :integer          not null, primary key
#  nombre :string(255)
#

require 'spec_helper'

describe Especialidad do
  it { should respond_to :nombre }

  it { should have_many :medicos }

  it { should validate_presence_of :nombre }
  it { should validate_uniqueness_of :nombre }

  describe "should validate nombre uniqueness in a non case sensitive way" do
    let( :especialidad ) { FactoryGirl.create( :especialidad ) }
    let( :especialidad_2 ) { FactoryGirl.create( :especialidad, nombre: "Otra" ) }
    let( :especialidad_nombre ) { especialidad.nombre.downcase }
    before { especialidad_2.nombre = especialidad_nombre }
    subject { especialidad_2 }
    it { should_not be_valid }
  end
end
