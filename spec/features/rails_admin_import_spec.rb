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
    a_file = create_csv_file_for 2, Compania
    click_the_menu_link_for "compania"
    click_the_action_link_for "import"
    attach_file "_admin_compania_import_archivo", a_file
    expect{ click_save_button }.to change{ CsvFile.count }.by(1)
  end
  it "creates two Compania records if the file contains those data" do
    a_file = create_csv_file_for 2, Compania
    click_the_menu_link_for "compania"
    click_the_action_link_for "import"
    attach_file "_admin_compania_import_archivo", a_file
    expect{ click_save_button }.to change{ Compania.count }.by(2)
    expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 2) )
  end
  it "should advise when not all the rows created a new record" do
    a_file = create_csv_file_for 2, Compania, true
    click_the_menu_link_for "compania"
    click_the_action_link_for "import"
    attach_file "_admin_compania_import_archivo", a_file
    expect{ click_save_button }.to change{ Compania.count }.by(1)
    expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 1) )
    expect( page ).to have_css( ".alert-error", text: I18n.t("errors.messages.created_records", records: 1) )
  end
end

def create_csv_file_for records, model, repeated = false
  the_file = "#{Rails.root}/spec/fixtures/test.csv"
  File.open(the_file, 'w') do |file| 
    file_content_for(model.to_s, repeated).each do |line_item|
      file.puts line_item
    end
  end
  the_file
end

def file_content_for model, repeated = false
  case model
    when "Compania" then
      line_items = repeated ? %w( "nombre" "Adeslas" "Adeslas" ) : %w( "nombre" "Adeslas" "Asisa" )
    else line_items = []
  end
  line_items
end