require 'spec_helper'

describe "Precios management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css("li[data-model=precio]")
    end
  end
end