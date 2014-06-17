require 'spec_helper'

describe "Dashboard" do

  describe "application management is done via Rails Admin" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    before { go_dashboard_and_login }
    it "should be cool" do
      expect( page ).to have_css( "a.brand", text: "Admin" )
    end
  end

end
