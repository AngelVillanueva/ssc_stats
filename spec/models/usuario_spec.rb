require 'spec_helper'

describe Usuario do
  let( :usuario ) { Usuario.new }
  subject { usuario }

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_uniqueness_of :email }
end
