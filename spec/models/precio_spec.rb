require 'spec_helper'

describe Precio do
  it { should respond_to :importe }
  it { should respond_to :vigencia }
  it { should respond_to :forfait? }

  it { should validate_numericality_of(:vigencia).is_greater_than_or_equal_to(2000) }
  it { should validate_numericality_of(:vigencia).is_less_than_or_equal_to(2030) }
end