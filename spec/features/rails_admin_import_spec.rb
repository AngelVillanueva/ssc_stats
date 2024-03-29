require 'spec_helper'

describe "Import as an option for certains models" do
  let( :usuario ) { FactoryGirl.create( :usuario ) }
  let( :models ) { [ SubtipoCoste, Compania, Especialidad, Usuario ] }
  let( :excluded_models ) { [ CsvFile, Episodio, Estancia, Medico, Precio, TipoCosteConTarifa, TipoCosteSinTarifa ] }
  before { go_dashboard_and_login }

  it "available for certain models" do
    models.each do |model|
      click_the_menu_link_for model.to_s.underscore
      expect( page ).to have_css( "li.import_collection_link" )
    end
  end
  it "not available for other models" do
    excluded_models.each do |model|
      click_the_menu_link_for model.to_s.underscore
      expect( page ).to_not have_css( "li.import_collection_link" )
    end
  end
  it "asks for a CSV file to import" do
    models.each do |model|
      click_the_menu_link_for model.to_s.underscore
      click_the_action_link_for "import"
      expect( page ).to have_css( "input[type='file'].archivo" )
    end
  end
  it "creates a temporary CsvFile record by uploading a csv file" do
    models.each do |model|
      upload_a_file_for 2, model
      expect{ click_save_button }.to change{ CsvFile.count }.by(1)
    end
  end
  it "should advise when the CsvFile format is wrong" do
    models.each do |model|
      model == Usuario ? current_model_count = 1 : current_model_count = 0
      upload_a_bad_file_for model
      expect{ click_save_button }.to_not change{ CsvFile.count }
      expect( model.count ).to eql current_model_count
      expect( page ).to have_css( ".alert-error", text: I18n.t( "errors.messages.invalid" ) )
    end
  end
  it "creates two Model records if the file contains those data" do
    models.each do |model|
      upload_a_file_for 2, model
      expect{ click_save_button }.to change{ model.count }.by(2)
      expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 2) )
    end
  end
  it "should advise when not all the rows created a new record" do
    models.each do |model|
      upload_a_file_for 2, model, "repetido"
      expect{ click_save_button }.to change{ model.count }.by(1)
      expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 1) )
      expect( page ).to have_css( ".alert-error", text: I18n.t("errors.messages.created_records", records: 1) )
    end
  end
  it "should advise when the row headers do not match the model attributes" do
    models.each do |model|
      upload_a_file_for 2, model, "wrong_headers"
      expect{ click_save_button }.to change{ model.count }.by(0)
      expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 0) )
      expect( page ).to have_css( ".alert-error", text: I18n.t("errors.messages.no_created_records" ) )
      expect( page ).to have_css( ".alert-notice", text: I18n.t("errors.messages.bad_row_headers" ) )
    end
  end
  it "should ignore the file content when rows do not match all the model attributes" do
    models.each do |model|
      upload_a_file_for 2, model, "mixed_wrong"
      expect{ click_save_button }.to change{ model.count }.by(0)
      expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 0) )
      expect( page ).to have_css( ".alert-error", text: I18n.t("errors.messages.no_created_records" ) )
      expect( page ).to have_css( ".alert-notice", text: I18n.t("errors.messages.bad_row_headers" ) )
    end
  end
  it "should advise when the file format is ok but the content is corrupted" do
    upload_a_corrupted_file_for Usuario
    expect{ click_save_button }.to change{ Usuario.count }.by(0)
    expect( page ).to have_css( ".alert-success", text: I18n.t("exitos.messages.created_records", records: 0) )
    expect( page ).to have_css( ".alert-error", text: I18n.t("errors.messages.no_created_records" ) )
    expect( page ).to have_css( ".alert-notice", text: I18n.t("errors.messages.corrupted_content" ) )
  end
end

### AUX METHODS

def upload_a_bad_file_for model
  a_file = "#{Rails.root}/spec/fixtures/test.jpg"
  click_the_menu_link_for model.to_s.underscore
  click_the_action_link_for "import"
  attach_file "_admin_#{model.to_s.underscore}_import_archivo", a_file
end

def upload_a_corrupted_file_for model
  a_file = "#{Rails.root}/spec/fixtures/test_user.csv"
  click_the_menu_link_for model.to_s.underscore
  click_the_action_link_for "import"
  attach_file "_admin_#{model.to_s.underscore}_import_archivo", a_file
end

def upload_a_file_for records, model, type = "normal"
  a_file = create_csv_file_for records, model, type
  click_the_menu_link_for model.to_s.underscore
  click_the_action_link_for "import"
  attach_file "_admin_#{model.to_s.underscore}_import_archivo", a_file
end

def create_csv_file_for records, model, type = "normal"
  the_file = "#{Rails.root}/spec/fixtures/test.csv"
  CSV.open(the_file, 'wb') do |csv| 
    file_content_for(model.to_s, type).each do |row|
      csv << row
    end
  end
  the_file
end

def file_content_for model, type = "normal"
  case model
    when "SubtipoCoste"
      case type
        when "repetido" then rows = [ %w( descripcion ), %w( Estancia ), %w( Estancia ) ]
        when "wrong_headers" then rows = [ %w( nombre ), %w( Estancia ), %w( Quirófano ) ]
        when "mixed_wrong" then rows = [ %w( descripcion nombre ), %w( Estancia Otro ), %w( Quirófano Más ) ]
        else rows = [ %w( descripcion ), %w( Estancia ), %w( Quirófano ) ]
      end
    when "Compania"
      case type
        when "repetido" then rows = [ %w( nombre ), %w( Adeslas ), %w( Adeslas ) ]
        when "wrong_headers" then rows = [ %w( concepto ), %w( Adeslas ), %w( Asisa ) ]
        when "mixed_wrong" then rows = [ %w( concepto nombre ), %w( Estancia Adeslas ), %w( Quirófano Asisa ) ]
        else rows = [ %w( nombre ), %w( Adeslas ), %w( Asisa ) ]
      end
    when "Especialidad"
      case type
        when "repetido" then rows = [ %w( nombre ), %w( Alergia ), %w( Alergia ) ]
        when "wrong_headers" then rows = [ %w( concepto ), %w( Diagnosis ), %w( Alergia ) ]
        when "mixed_wrong" then rows = [ %w( concepto descripcion ), %w( Diagnosis Estancia ), %w( Alergia Quirófano ) ]
        else rows = [ %w( nombre ), %w( Diagnosis ), %w( Alergia ) ]
      end
    when "Usuario"
      case type
      when "repetido" then rows = [ %w( email password password_confirmation ), %w( test@example.com foobarfoo foobarfoo ), %w( test@example.com foobarfoo foobarfoo ) ]
      when "wrong_headers" then rows = [ %w( email password password_confirmations ), %w( test@example.com foobarfoo foobarfoo ), %w( sample@example.net foobarfoo foobarfoo ) ]
      when "mixed_wrong" then rows = [ %w( nombre email password password_confirmations ), %w( myself test@example.com foobarfoo foobarfoo ), %w( myself sample@example.net foobarfoo foobarfoo ) ]
      else rows = [ %w( email password password_confirmation ), %w( test@example.com foobarfoo foobarfoo ), %w( sample@example.net foobarfoo foobarfoo ) ]
      end
    else rows = [[]]
  end
  rows
end