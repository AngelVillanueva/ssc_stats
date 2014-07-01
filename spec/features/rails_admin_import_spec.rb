require 'spec_helper'

describe "Import as an option for certains models" do
  let( :usuario ) { FactoryGirl.create( :usuario ) }
  before { go_dashboard_and_login }

  it "available for Compañías" do
    click_the_menu_link_for "compania"
    expect( page ).to have_css( "li.import_collection_link" )
  end
  it "asks for a CSV file to import" do
    click_the_menu_link_for "compania"
    click_the_action_link_for "import"
    expect( page ).to have_css( "input[type='file'].archivo" )
  end
  it "creates a temporary CsvFile record by uploading a csv file" do
    click_the_menu_link_for "compania"
    click_the_action_link_for "import"
    attach_file "_admin_compania_import_archivo", "#{Rails.root}/spec/fixtures/test.csv"
    expect{ click_save_button }.to change{ CsvFile.count }.by(1)
  end
  it "creates two Compania records if the file contains those data" do
    a_file = create_csv_file_for 2, Compania
    click_the_menu_link_for "compania"
    click_the_action_link_for "import"
    attach_file "_admin_compania_import_archivo", a_file
    expect{ click_save_button }.to change{ Compania.count }.by(2)
    expect( page ).to have_css( ".alert-success", text: "2 creados" )
  end
end

def create_csv_file_for records, model
  the_file = "#{Rails.root}/spec/fixtures/test.csv"
  File.open(the_file, 'w') do |file| 
    file.puts "\"nombre\""
    file.puts "\"Adeslas\""
    file.puts "\"Asisa\""
  end
  the_file
end