require 'spec_helper'

describe GrupoQuirurgico do
  it { should respond_to :nombre }

  it { should validate_presence_of :nombre }
  it { should validate_uniqueness_of :nombre }
end