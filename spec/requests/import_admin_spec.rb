require 'spec_helper'

describe "Import functionality for Admin" do
  describe "admin users should be able to import csv files" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    before { go_dashboard_and_login }

    it "by clicking the main menu link" do
      click_the_menu_link_for "csv_file"
    end
    it "by uploading a csv file" do
      click_the_menu_link_for "csv_file"
      click_the_action_link_for "new"
      select I18n.t("activerecord.models.compania"), from: "csv_file_modelo"
      attach_file "csv_file_archivo", "#{Rails.root}/spec/fixtures/test.csv"
      click_save_button
      expect( CsvFile.count ).to eql 1
    end
    it "by selecting the Model to be updated with" do
      click_the_menu_link_for "csv_file"
      click_the_action_link_for "new"
      select I18n.t("activerecord.models.medico"), from: "csv_file_modelo"
      attach_file "csv_file_archivo", "#{Rails.root}/spec/fixtures/test.csv"
      click_save_button
      expect( CsvFile.count ).to eql 1
    end
    it "that will reside in the uploads folder" do
      click_the_menu_link_for "csv_file"
      click_the_action_link_for "new"
      select I18n.t("activerecord.models.especialidad"), from: "csv_file_modelo"
      attach_file "csv_file_archivo", "#{Rails.root}/spec/fixtures/test.csv"
      click_save_button
      uploaded_file = "#{Rails.root}/uploads/csv_files/#{CsvFile.first.id}/test.csv"
      expect( File.exists? uploaded_file ).to eql true
    end
    it "do not accept other file formats" do
      click_the_menu_link_for "csv_file"
      click_the_action_link_for "new"
      select I18n.t("activerecord.models.medico"), from: "csv_file_modelo"
      attach_file "csv_file_archivo", "#{Rails.root}/spec/fixtures/test.jpg"
      click_save_button
      expect( CsvFile.count ).to eql 0
    end
    it "by seeing its related Archivo filename" do
      click_the_menu_link_for "csv_file"
      click_the_action_link_for "new"
      select I18n.t("activerecord.models.compania"), from: "csv_file_modelo"
      attach_file "csv_file_archivo", "#{Rails.root}/spec/fixtures/test.csv"
      click_save_button
      click_the_menu_link_for "csv_file"
      expect( page ).to have_css( "td.archivo_field", text: /\Atest.csv\z/ )
    end
  end
end