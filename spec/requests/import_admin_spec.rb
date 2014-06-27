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
      attach_file "csv_file_archivo", "#{Rails.root}/spec/fixtures/test.csv"
      click_save_button
      expect( CsvFile.count ).to eql 1
    end
  end
end