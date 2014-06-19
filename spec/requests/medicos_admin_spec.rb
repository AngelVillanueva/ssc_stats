require 'spec_helper'

describe "Medicos management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :especialidad ) { FactoryGirl.create( :especialidad ) }
    let( :medico ) { FactoryGirl.create( :medico, especialidad: especialidad ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=medico]" )
    end
    it "by clicking the link" do
      click_the_menu_link_for "medico"
    end
    it "by seeing the related Especialidad" do
      expect( especialidad ).to be_valid
      expect( medico ).to be_valid
      click_the_menu_link_for "medico"
      expect( page ).to have_css( "td.especialidad_field", text: "Obstetricia" )
    end
    it "by not seeing its Episodios when editing" do
      click_the_menu_link_for "medico"
      click_the_action_link_for "new"
      expect( page).to_not have_css( "div.episodios_field")
    end
  end
end