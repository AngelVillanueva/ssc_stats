require 'spec_helper'

describe "Precios management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :compania ) { FactoryGirl.create( :compania ) }
    let( :concepto_de_coste ) { FactoryGirl.create( :tipo_coste_con_tarifa ) }
    let( :precio ) { FactoryGirl.create( :precio, compania: compania, tipo_coste_con_tarifa: concepto_de_coste ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=precio]" )
    end
    it "by clicking the link" do
      click_the_menu_link_for "precio"
    end
    it "by seeing the right currency" do
      expect( precio ).to be_valid
      click_the_menu_link_for "precio"
      expect( page ).to have_css( "td.importe_field", text: "€" )
    end
    it "by seeing the related Compania" do
      expect( precio ).to be_valid
      expect( compania ).to be_valid
      click_the_menu_link_for "precio"
      expect( page ).to have_css( "td.compania_field", text: "Factory de Compañía" )
    end
    it "by seeing the related Tipo de Coste" do
      expect( concepto_de_coste ).to be_valid
      expect( compania ).to be_valid
      expect( precio ).to be_valid
      click_the_menu_link_for "precio"
      expect( page ).to have_css( "td.tipo_coste_con_tarifa_field", text: "Electrocardiograma" )
    end
  end
end