require 'spec_helper'

describe "Dashboard" do

  # describe "are restricted" do
  #   it "should ask for login to registered users" do
  #     get '/'
  #     response.status.should_not be(200)
  #     visit root_path
  #     expect( page ).to have_title( I18n.t("Restricted") )
  #   end
  # end

  # describe "not allow the entrance to non-registered users" do
  #   let( :usuario ) { FactoryGirl.create( :usuario ) }
  #   before do
  #     go_home_and_login
  #   end
  #   subject { page }

  #   it { should have_content( "Bienvenidos" ) }
  #   it { should have_title( "Santa Cristina | Inicio" ) }
  # end

  # describe "registered usuarios should be able to log out" do
  #   let( :usuario ) { FactoryGirl.create( :usuario ) }
  #   before do
  #     go_home_and_login
  #   end
  #   subject { page }

  #   it { should have_content( "Bienvenidos" ) }
  #   it "can logout" do
  #     should have_css( "a.logout" )
  #     click_link I18n.t( 'devise.custom.sign_out' )
  #     should have_title( I18n.t("Restricted") )
  #   end
  # end

  # describe "non-registered users cannot see the logout link" do
  #   before { visit root_path }
  #   it "should not be visible" do
  #     expect( page ).to_not have_css( "a.logout" )
  #   end
  # end
  describe "application management is done via Rails Admin" do
    before { visit rails_admin.dashboard_path }
    it "should be cool" do
      expect( page ).to have_title( "I am kool" )
    end
  end

end
