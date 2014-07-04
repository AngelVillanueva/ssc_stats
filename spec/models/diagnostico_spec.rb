# == Schema Information
#
# Table name: diagnosticos
#
#  id          :integer          not null, primary key
#  episodio_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'


describe Diagnostico do
  it { should belong_to :episodio }
  it { should belong_to :tipo_coste_con_tarifa }
end
