require 'spec_helper'

describe "Tipos de Coste con Tarifa management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :compania ) { FactoryGirl.create( :compania ) }
    let( :concepto_de_coste ) { FactoryGirl.create( :tipo_coste_con_tarifa ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=tipo_coste_con_tarifa]" )
    end
    it "by clicking the link" do
      click_the_menu_link_for "tipo_coste_con_tarifa"
    end
    it "by seeing its name" do
      expect( compania ).to be_valid
      expect( concepto_de_coste ).to be_valid
      click_the_menu_link_for "tipo_coste_con_tarifa"
      expect( page ).to have_css( "td.concepto_field", text: "Electrocardiograma" )
    end
    it "by not seeing its Prices when editing" do
      click_the_menu_link_for "tipo_coste_con_tarifa"
      click_the_action_link_for "new"
      expect( page).to_not have_css( "div.precios_field")
    end
  end
end