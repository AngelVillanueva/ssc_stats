require 'spec_helper'

describe "Diagnosticos management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :compania ) { FactoryGirl.create( :compania ) }
    let( :medico ) { FactoryGirl.create( :medico ) }
    let( :subtipo ) { FactoryGirl.create( :subtipo_coste, descripcion: "Quirófano" ) }
    let( :subtipo_2 ) { FactoryGirl.create( :subtipo_coste, descripcion: "Estancia" ) }
    let( :tipo ) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Sala de Partos", subtipo_coste: subtipo ) }
    let( :tipo_2 ) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Reanimación", subtipo_coste: subtipo_2 ) }
    let( :episodio ) { FactoryGirl.create( :episodio, compania: compania, medico: medico ) }
    let( :codigo_omc ) { FactoryGirl.create( :codigo_omc ) }
    let( :diagnostico ) { FactoryGirl.create( :diagnostico, episodio: episodio, tipo_coste_con_tarifa: tipo, codigo_omc: codigo_omc ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=estancia]" )
    end
    it "by clicking the link" do
      click_the_menu_link_for "diagnostico"
    end
    it "by seeing the related Episodio" do
      expect( episodio ).to be_valid
      expect( diagnostico ).to be_valid
      click_the_menu_link_for "diagnostico"
      expect( page ).to have_css( "td.episodio_field", text: episodio.id )
    end
    it "by seeing the related Tipo de Coste" do
      expect( tipo ).to be_valid
      expect( episodio ).to be_valid
      expect( diagnostico ).to be_valid
      click_the_menu_link_for "diagnostico"
      expect( page ).to have_css( "td.tipo_coste_con_tarifa_field", text: tipo.concepto )
    end
    it "by seeing the related Codigo Omc" do
      expect( episodio ).to be_valid
      expect( codigo_omc ).to be_valid
      expect( diagnostico ).to be_valid
      click_the_menu_link_for "diagnostico"
      expect( page ).to have_css( "td.codigo_omc_field", text: codigo_omc.codigo )
      expect( page ).to have_css( "td.codigo_omc_field", text: codigo_omc.descripcion )
    end
    it "by accepting a valid Tipo de Coste" do
      expect( tipo ).to be_valid
      expect( episodio ).to be_valid
      expect( codigo_omc ).to be_valid
      expect( diagnostico ).to be_valid
      click_the_menu_link_for "diagnostico"
      click_the_action_link_for "new"
      select episodio.id, from: "diagnostico_episodio_id"
      select tipo.concepto, from: "diagnostico_tipo_coste_con_tarifa_id"
      select codigo_omc.descripcion, from: "diagnostico_codigo_omc_id"
      save_button = find( :css, "button[name=_save]" )
      expect{ save_button.click }.to change{ Diagnostico.count }.by(1)
    end
    it "by not accepting an invalid Tipo de Coste" do
      expect( tipo ).to be_valid
      expect( tipo_2 ).to be_valid
      expect( episodio ).to be_valid
      expect( codigo_omc ).to be_valid
      expect( diagnostico ).to be_valid
      click_the_menu_link_for "diagnostico"
      click_the_action_link_for "new"
      select episodio.id, from: "diagnostico_episodio_id"
      select tipo_2.concepto, from: "diagnostico_tipo_coste_con_tarifa_id"
      select codigo_omc.descripcion, from: "diagnostico_codigo_omc_id"
      save_button = find( :css, "button[name=_save]" ) 
      expect{ save_button.click }.to_not change{ Diagnostico.count }
    end
  end
end