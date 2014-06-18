require 'spec_helper'

describe "Tipos de Coste sin Tarifa management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :compania ) { FactoryGirl.create( :compania ) }
    let( :subtipo ) { FactoryGirl.create( :subtipo_coste ) }
    let( :concepto_de_coste ) { FactoryGirl.create( :tipo_coste_sin_tarifa, subtipo_coste: subtipo ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=tipo_coste_sin_tarifa]" )
    end
    it "by clicking the link" do
      click_the_menu_link_for "tipo_coste_sin_tarifa"
    end
    it "by seeing its name" do
      expect( compania ).to be_valid
      expect( concepto_de_coste ).to be_valid
      click_the_menu_link_for "tipo_coste_sin_tarifa"
      expect( page ).to have_css( "td.concepto_field", text: "Producto sanitario" )
    end
    it "by seeing its related SubtipoCoste" do
      expect( compania ).to be_valid
      expect( concepto_de_coste ).to be_valid
      click_the_menu_link_for "tipo_coste_sin_tarifa"
      expect( page ).to have_css( "td.subtipo_coste_field", text: "Otros" )
    end
    it "by seeing its SubtipoCoste when editing" do
      click_the_menu_link_for "tipo_coste_sin_tarifa"
      click_the_action_link_for "new"
      expect( page).to have_css( "div.subtipo_coste_field")
    end
  end
end