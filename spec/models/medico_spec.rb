# == Schema Information
#
# Table name: medicos
#
#  id              :integer          not null, primary key
#  nombre_pila     :string(255)
#  apellidos       :string(255)
#  especialidad_id :integer
#

require 'spec_helper'

describe Medico do
  it { should respond_to :nombre_pila }
  it { should respond_to :apellidos }
  it { should respond_to :nombre_completo }

  it { should belong_to :especialidad }
  it { should have_many :episodios }

  it { should validate_presence_of :nombre_pila }
  it { should validate_presence_of :apellidos }
  it { should validate_presence_of :especialidad }
end
