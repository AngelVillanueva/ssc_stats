require 'spec_helper'

describe Precio do
  it { should respond_to :importe }
  it { should respond_to :vigencia }
  it { should respond_to :incluido_en_forfait }
  it { should respond_to :compania }

  it { should validate_presence_of :importe }
  it { should validate_presence_of :vigencia}
  it { should validate_presence_of :incluido_en_forfait }
  it { should validate_presence_of :compania }

  it { should validate_numericality_of(:importe).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:vigencia).is_greater_than_or_equal_to(2000) }
  it { should validate_numericality_of(:vigencia).is_less_than_or_equal_to(2030) }
end