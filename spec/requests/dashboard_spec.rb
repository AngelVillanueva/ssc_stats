require 'spec_helper'

describe "Dashboard" do

  describe "application management is done via Rails Admin" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    before { go_dashboard_and_login }
    it "shows Admin string" do
      expect( page ).to have_css( "a.brand", text: "Admin" )
    end
  end
  describe "root page is Rails Admin dashboard" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    before { go_home_and_login }
    it "shows Admin string" do
      expect( page ).to have_css( "a.brand", text: "Admin" )
    end
  end
  describe "is restricted" do
    it "should ask for login to registered users" do
      get '/'
      response.status.should_not be(200)
      visit root_path
      expect( page ).to have_title( I18n.t("Restricted") )
    end
  end
  describe "not allow the entrance to non-registered users" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    before do
      go_home_and_login
    end
    subject { page }

    it { should have_css( "a.brand", text: "Admin" ) }
  end

  describe "registered usuarios should be able to log out" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    before do
      go_home_and_login
    end
    subject { page }

    it { should have_css( "a.brand", text: "Admin" ) }
    it "can logout" do
      click_link I18n.t( 'admin.misc.log_out' )
      should have_title( I18n.t("Restricted") )
    end
  end

  describe "non-registered users cannot see the brand link" do
    before { visit root_path }
    it "should not be visible" do
      expect( page ).to_not have_css( "a.brand" )
    end
  end

end
