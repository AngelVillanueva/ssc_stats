require 'spec_helper'

describe "Episodios management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :compania ) { FactoryGirl.create( :compania ) }
    let( :medico ) { FactoryGirl.create( :medico ) }
    let( :subtipo ) { FactoryGirl.create( :subtipo_coste, descripcion: "Estancia" ) }
    let( :tipo ) { FactoryGirl.create( :tipo_coste_con_tarifa, subtipo_coste: subtipo ) }
    let( :episodio ) { FactoryGirl.create( :episodio, compania: compania, medico: medico ) }
    let( :estancia ) { FactoryGirl.create( :estancia, episodio: episodio, cantidad: 3, tipo_coste_con_tarifa: tipo ) }
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
    it "by seeing the related Especialidad" do
      expect( compania ).to be_valid
      expect( medico ).to be_valid
      expect( episodio ).to be_valid
      click_the_menu_link_for "episodio"
      expect( page ).to have_css( "td.especialidad_field", text: "Obstetricia" )
    end
    it "by seeing the related Estancias" do
      expect( compania ).to be_valid
      expect( medico ).to be_valid
      expect( episodio ).to be_valid
      expect( estancia ).to be_valid
      click_the_menu_link_for "episodio"
      click_next_page_link
      expect( page ).to have_css( "td.total_estancias_field", text: "3" )
    end
    it "by not seeing its Episodio when editing" do
      click_the_menu_link_for "episodio"
      click_the_action_link_for "new"
      expect( page).to_not have_css( "div.especialidad_field")
    end
    it "by seeing its Medico fullname when editing" do
      expect( medico ).to be_valid
      click_the_menu_link_for "episodio"
      click_the_action_link_for "new"
      expect( page).to have_select( "episodio_medico_id", :options => ['','Gregory House MD'])
    end
    it "by seeing its Estancias when editing" do
      expect( medico ).to be_valid
      click_the_menu_link_for "episodio"
      click_the_action_link_for "new"
      expect( page).to have_css( "div.estancias_field")
    end
  end
end