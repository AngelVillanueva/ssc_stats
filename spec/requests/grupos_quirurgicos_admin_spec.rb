require 'spec_helper'

describe "Grupos Quirúrgicos management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :grupo_quirurgico ) { FactoryGirl.create( :grupo_quirurgico ) }
    let( :codigo_omc ) { FactoryGirl.create( :codigo_omc, grupo_quirurgico: grupo_quirurgico ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=grupo_quirurgico]" )
    end
    it "by clicking the link" do
      click_the_menu_link_for "grupo_quirurgico"
    end
    it "by seeing the related Códigos OMC" do
      expect( codigo_omc ).to be_valid
      expect( grupo_quirurgico ).to be_valid
      click_the_menu_link_for "grupo_quirurgico"
      expect( page ).to have_css( "td.codigos_omc_field", text: "#{codigo_omc.codigo} - #{codigo_omc.descripcion}" )
    end
  end
end