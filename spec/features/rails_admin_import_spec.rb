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
    expect{ click_commit_button }.to change{ CsvFile.count }.by(1)
  end
end