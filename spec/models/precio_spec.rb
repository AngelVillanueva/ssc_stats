require 'spec_helper'

describe Precio do
  it { should respond_to :importe }
  it { should respond_to :vigencia }
  it { should respond_to :forfait? }
end