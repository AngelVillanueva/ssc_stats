require 'spec_helper'

describe "StaticPages" do

  describe "are restricted to registered users" do
    it "should ask for login" do
      get '/'
      response.status.should_not be(200)
      visit root_path
      expect( page ).to have_title( I18n.t("Restricted") )
    end
  end

  describe "registered usuarios should be allowed" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    before do
      go_home_and_login
    end
    subject { page }

    it { should have_content( "Bienvenidos" ) }
    it { should have_title( "Santa Cristina | Inicio" ) }
  end

  describe "registerd usuarios should be able to log out" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    before do
      go_home_and_login
    end
    subject { page }

    it { should have_content( "Bienvenidos" ) }
    it "can logout" do
      should have_css( "a.logout" )
      click_link I18n.t( 'devise.custom.sign_out' )
      should have_title( I18n.t("Restricted") )
    end
  end

end
