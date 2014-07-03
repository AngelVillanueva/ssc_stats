# == Schema Information
#
# Table name: subtipos_coste
#
#  id          :integer          not null, primary key
#  descripcion :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe SubtipoCoste do
  it { should respond_to :descripcion }

  it { should have_many :tipo_coste_con_tarifas }
  it { should have_many :tipo_coste_sin_tarifas }

  it { should validate_presence_of :descripcion }
  it { should validate_uniqueness_of :descripcion }
  describe "should validate descripcion uniqueness in a non case sensitive way" do
    let( :subtipo ) { FactoryGirl.create( :subtipo_coste ) }
    let( :subtipo_2 ) { FactoryGirl.create( :subtipo_coste, descripcion: "Otra" ) }
    let( :descripcion_1 ) { subtipo.descripcion.downcase }
    before { subtipo_2.descripcion = descripcion_1 }
    subject { subtipo_2 }
    it { should_not be_valid }
  end
end
