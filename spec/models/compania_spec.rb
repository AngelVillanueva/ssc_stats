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
  it { should respond_to :precios }

  it { should validate_presence_of :nombre } 
end
