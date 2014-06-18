require 'spec_helper'

describe "Precios management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :compania ) { FactoryGirl.create( :compania ) }
    let( :precio ) { FactoryGirl.create( :precio, compania: compania ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=precio]" )
    end
    it "by clicking the link" do
      precios_link = find( :css, "li[data-model=precio] a" )
      precios_link.click
    end
    it "by seeing the right currency" do
      expect( precio ).to be_valid
      precios_link = find( :css, "li[data-model=precio] a" )
      precios_link.click
      expect( page ).to have_css( "td.importe_field", text: "€" )
    end
    it "by seeing the related Compania" do
      expect( precio ).to be_valid
      expect( compania ).to be_valid
      precios_link = find( :css, "li[data-model=precio] a" )
      precios_link.click
      expect( page ).to have_css( "td.compania_field", text: "Factory de Compañía" )
    end
  end
end