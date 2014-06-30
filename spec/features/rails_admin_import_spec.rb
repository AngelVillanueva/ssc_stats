require 'spec_helper'

describe "Import as an option for certains models" do
  let( :usuario ) { FactoryGirl.create( :usuario ) }
  before { go_dashboard_and_login }

  it "available for Compañías" do
    click_the_menu_link_for "compania"
    expect( page ).to have_css( "li.import_collection_link" )
  end
end