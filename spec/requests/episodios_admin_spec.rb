require 'spec_helper'

describe "Episodios management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :compania ) { FactoryGirl.create( :compania ) }
    let( :medico ) { FactoryGirl.create( :medico ) }
    let( :episodio ) { FactoryGirl.create( :episodio, compania: compania, medico: medico ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=episodio]" )
    end
    it "by clicking the link" do
      click_the_menu_link_for "episodio"
    end
    it "by seeing the related Compania" do
      expect( compania ).to be_valid
      expect( episodio ).to be_valid
      click_the_menu_link_for "episodio"
      expect( page ).to have_css( "td.compania_field", text: "Factory de Compañía" )
    end
    it "by seeing the related Medico" do
      expect( compania ).to be_valid
      expect( medico ).to be_valid
      expect( episodio ).to be_valid
      click_the_menu_link_for "episodio"
      expect( page ).to have_css( "td.medico_field", text: "Gregory House MD" )
    end
  end
end