# == Schema Information
#
# Table name: codigos_omc
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  descripcion :string(255)
#  codigo      :integer
#

require 'spec_helper'

describe CodigoOmc do
  it { should respond_to :codigo }
  it { should respond_to :descripcion }

  it { should have_many :diagnosticos }

  it { should validate_presence_of :codigo }
  it { should validate_uniqueness_of :codigo }
  it { should validate_presence_of :descripcion }
end
