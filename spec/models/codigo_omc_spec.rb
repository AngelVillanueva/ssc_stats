require 'spec_helper'

describe CodigoOmc do
  it { should respond_to :codigo }
  it { should respond_to :descripcion }

  it { should validate_presence_of :codigo }
  it { should validate_uniqueness_of :codigo }
  it { should validate_presence_of :descripcion }
end