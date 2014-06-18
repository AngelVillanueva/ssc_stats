# == Schema Information
#
# Table name: precios
#
#  id                  :integer          not null, primary key
#  importe             :decimal(, )
#  vigencia            :integer
#  incluido_en_forfait :boolean
#  compania_id         :integer
#

require 'spec_helper'

describe Precio do
  it { should respond_to :importe }
  it { should respond_to :vigencia }
  it { should respond_to :incluido_en_forfait }
  it { should respond_to :compania }

  it { should validate_presence_of :importe }
  it { should validate_presence_of :vigencia}
  it { should validate_presence_of :compania }

  it { should validate_numericality_of(:importe).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:vigencia).is_greater_than_or_equal_to(2000) }
  it { should validate_numericality_of(:vigencia).is_less_than_or_equal_to(2030) }
  describe "with default Incluido en Forfait as true" do
    let( :un_precio ) { Precio.new }
    subject { un_precio }
    its( :incluido_en_forfait ) { should be_true }
  end
end
