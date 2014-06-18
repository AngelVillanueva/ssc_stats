require 'spec_helper'

describe "Compañías management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :compania ) { FactoryGirl.create( :compania ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=compania]" )
    end
    it "by clicking the link" do
      companias_link = find( :css, "li[data-model=compania] a" )
      companias_link.click
    end
    it "by seeing its name" do
      expect( compania ).to be_valid
      companias_link = find( :css, "li[data-model=compania] a" )
      companias_link.click
      expect( page ).to have_css( "td.nombre_field", text: "Factory de Compañía" )
    end
    it "by not seeing its Prices when editing" do
      click_the_menu_link_for "compania"
      click_the_action_link_for "new"
      expect( page).to_not have_css( "div.precios_field")
    end
  end
end