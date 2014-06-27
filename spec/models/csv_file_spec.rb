# == Schema Information
#
# Table name: csv_files
#
#  id                   :integer          not null, primary key
#  archivo_file_name    :string(255)
#  archivo_content_type :string(255)
#  archivo_file_size    :integer
#  archivo_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

require 'spec_helper'

describe CsvFile do
  it { should respond_to :archivo }
  describe "with mandatory Archivo file" do
    let( :file ) { FactoryGirl.create( :csv_file ) }
    before { file.archivo = nil }
    it { should_not be_valid }
  end
end
