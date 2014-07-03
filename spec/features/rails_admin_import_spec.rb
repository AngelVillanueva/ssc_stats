require 'spec_helper'

describe "Import as an option for certains models" do
  let( :usuario ) { FactoryGirl.create( :usuario ) }
  before { go_dashboard_and_login }

  it "available for Compañías" do
    click_the_menu_link_for "compania"
    expect( page ).to have_css( "li.import_collection_link" )
  end
  it "available for Especialidades" do
    click_the_menu_link_for "especialidad"
    expect( page ).to have_css( "li.import_collection_link" )
  end
  it "asks for a CSV file to import" do
    click_the_menu_link_for "compania"
    click_the_action_link_for "import"
    expect( page ).to have_css( "input[type='file'].archivo" )
  end
  it "creates a temporary CsvFile record by uploading a csv file" do
    upload_a_file_for 2, Compania
    expect{ click_save_button }.to change{ CsvFile.count }.by(1)
  end
  it "should advise when the CsvFile format is wrong" do
    upload_a_bad_file_for Compania
    expect{ click_save_button }.to_not change{ CsvFile.count }
    expect( Compania.count ).to eql 0
    expect( page ).to have_css( ".alert-error", text: I18n.t( "errors.messages.invalid" ) )
  end
  it "creates two Compania records if the file contains those data" do
    upload_a_file_for 2, Compania
    expect{ click_save_button }.to change{ Compania.count }.by(2)
    expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 2) )
  end
  it "creates two Especialidad records if the file contains those data" do
    upload_a_file_for 2, Especialidad
    expect{ click_save_button }.to change{ Especialidad.count }.by(2)
    expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 2) )
  end
  it "should advise when not all the rows created a new record" do
    upload_a_file_for 2, Compania, "repetido"
    expect{ click_save_button }.to change{ Compania.count }.by(1)
    expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 1) )
    expect( page ).to have_css( ".alert-error", text: I18n.t("errors.messages.created_records", records: 1) )
  end
  it "should advise when the row headers do not match the model attributes" do
    upload_a_file_for 2, Compania, "wrong_headers"
    click_save_button
    save_and_open_page 
    expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 0) )
    expect( page ).to have_css( ".alert-error", text: I18n.t("errors.messages.no_created_records" ) )
    expect( page ).to have_css( ".alert-notice", text: I18n.t("errors.messages.bad_row_headers" ) )
  end
  # it "should ignore the headers when not match the model attributes" do
  #   upload_a_file_for 2, Compania, "1_wrong_header"
  #   expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 0) )
  # end
end

### AUX METHODS

def upload_a_bad_file_for model
  a_file = "#{Rails.root}/spec/fixtures/test.jpg"
  click_the_menu_link_for model.to_s.downcase
  click_the_action_link_for "import"
  attach_file "_admin_#{model.to_s.downcase}_import_archivo", a_file
end

def upload_a_file_for records, model, type = "normal"
  a_file = create_csv_file_for records, model, type
  click_the_menu_link_for model.to_s.downcase
  click_the_action_link_for "import"
  attach_file "_admin_#{model.to_s.downcase}_import_archivo", a_file
end

def create_csv_file_for records, model, type = "normal"
  the_file = "#{Rails.root}/spec/fixtures/test.csv"
  File.open(the_file, 'w') do |file| 
    file_content_for(model.to_s, type).each do |line_item|
      file.puts line_item
    end
  end
  the_file
end

def file_content_for model, type = "normal"
  case model
    when "Compania"
      case type
        when "repetido" then line_items = %w( "nombre" "Adeslas" "Adeslas" )
        when "wrong_headers" then line_items = %w( "concepto" "Adeslas" "Adeslas" )
        else line_items = %w( "nombre" "Adeslas" "Asisa" )
      end
    when "Especialidad"
      case type
        when "repetido" then line_items = %w( "nombre" "Diagnosis" "Diagnosis" )
        else line_items = %w( "nombre" "Diagnosis" "Alergia" )
      end
    else line_items = [""]
  end
  line_items
end