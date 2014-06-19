require 'spec_helper'

describe Medico do
  it { should respond_to :nombre }
  it { should respond_to :apellidos }

  it { should have_many :episodios }

  it { should validate_presence_of :nombre }
  it { should validate_presence_of :apellidos }
end