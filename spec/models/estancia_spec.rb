require 'spec_helper'

describe Estancia do
  it { should respond_to :cantidad }

  it { should belong_to :episodio }
  it { should belong_to :tipo_coste_con_tarifa }

  it { should validate_presence_of :cantidad }
  it { should validate_presence_of :episodio }
  it { should validate_presence_of :tipo_coste_con_tarifa }
  it { should validate_numericality_of( :cantidad ).is_greater_than_or_equal_to( 1 ) }
end