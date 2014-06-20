require 'spec_helper'

describe Estancia do
  it { should belong_to :episodio }

  it { should validate_presence_of :episodio }
end