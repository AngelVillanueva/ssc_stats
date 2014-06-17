require 'spec_helper'


describe Compania do
  it { should respond_to :nombre }
  it { should respond_to :precios }

  it { should validate_presence_of :nombre } 
end