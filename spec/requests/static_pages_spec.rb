require 'spec_helper'

describe "StaticPages" do

  describe "are restricted to registered users" do
    it "should ask for login" do
      get '/'
      response.status.should_not be(200)
    end
  end

  describe "registered usuarios should be allowed" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    before do
      visit root_path
      fill_in "usuario[email]", with: usuario.email
      fill_in "usuario[password]", with: usuario.password
      click_button I18n.t( 'devise.custom.sign_in' )
    end
    subject { page }

    it { should have_content( "Bienvenidos" ) }
    it { should have_title( "Santa Cristina | Inicio" ) }
  end
end
