# == Schema Information
#
# Table name: episodios
#
#  id           :integer          not null, primary key
#  nhc          :integer
#  fecha_alta   :date
#  es_ambulante :boolean
#  compania_id  :integer
#  medico_id    :integer
#

require 'spec_helper'

describe Episodio do
  it { should respond_to :nhc }
  it { should respond_to :fecha_alta }
  it { should respond_to :es_ambulante }

  it { should belong_to :compania }
  it { should belong_to :medico }

  it { should validate_presence_of :nhc }
  it { should validate_numericality_of(:nhc).is_greater_than_or_equal_to(1) }
  it { should validate_presence_of :fecha_alta }
  it { should validate_presence_of :compania }
  it { should validate_presence_of :medico }
  describe "its fecha de alta should be at least from year 2000" do
    let( :episodio ) { FactoryGirl.create( :episodio ) }
    before { episodio.fecha_alta = "31/12/1999".to_date }
    subject { episodio }
    it { should_not be_valid }
  end
  describe "its fecha de alta should be up to year 2030" do
    let( :episodio ) { FactoryGirl.create( :episodio ) }
    before { episodio.fecha_alta = "01/01/2031".to_date }
    subject { episodio }
    it { should_not be_valid }
  end
  describe "its es_ambulante field should defaults to false" do
    let( :episodio ) { Episodio.new }
    subject { episodio }
    its( :es_ambulante ) { should eql false }
  end
end
