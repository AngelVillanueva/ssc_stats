require 'spec_helper'

describe "Estancias management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :compania ) { FactoryGirl.create( :compania ) }
    let( :medico ) { FactoryGirl.create( :medico ) }
    let( :subtipo ) { FactoryGirl.create( :subtipo_coste, descripcion: "Estancia" ) }
    let( :subtipo_2 ) { FactoryGirl.create( :subtipo_coste, descripcion: "Quirófano" ) }
    let( :tipo ) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Estancia", subtipo_coste: subtipo ) }
    let( :tipo_2 ) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Reanimación", subtipo_coste: subtipo ) }
    let( :tipo_3 ) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Hospital de día", subtipo_coste: subtipo ) }
    let( :tipo_4 ) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Sala de partos", subtipo_coste: subtipo_2 ) }
    let( :episodio ) { FactoryGirl.create( :episodio, compania: compania, medico: medico ) }
    let( :estancia ) { FactoryGirl.create( :estancia, episodio: episodio, cantidad: 3, tipo_coste_con_tarifa: tipo ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=estancia]" )
    end
    it "by clicking the link" do
      click_the_menu_link_for "estancia"
    end
    it "by seeing the related Cantidad" do
      expect( episodio ).to be_valid
      expect( estancia ).to be_valid
      click_the_menu_link_for "estancia"
      expect( page ).to have_css( "td.cantidad_field", text: "3" )
    end
    it "by seeing the related Episodio" do
      expect( episodio ).to be_valid
      expect( estancia ).to be_valid
      click_the_menu_link_for "estancia"
      expect( page ).to have_css( "td.episodio_field", text: episodio.id )
    end
    it "by seeing the related Tipo de Coste" do
      expect( tipo ).to be_valid
      expect( episodio ).to be_valid
      expect( estancia ).to be_valid
      click_the_menu_link_for "estancia"
      expect( page ).to have_css( "td.tipo_coste_con_tarifa_field", text: tipo.concepto )
    end
    it "by accepting a valid Tipo de Coste" do
      expect( tipo ).to be_valid
      expect( episodio ).to be_valid
      expect( estancia ).to be_valid
      click_the_menu_link_for "estancia"
      click_the_action_link_for "new"
      fill_in "estancia_cantidad", with: 1
      select episodio.id, from: "estancia_episodio_id"
      select tipo.concepto, from: "estancia_tipo_coste_con_tarifa_id" 
      find( :css, "button[name=_save]" ).click
      expect( Estancia.count ).to eql 2
    end
    it "by not accepting an invalid Tipo de Coste" do
      expect( tipo ).to be_valid
      expect( tipo_4 ).to be_valid
      expect( episodio ).to be_valid
      expect( estancia ).to be_valid
      click_the_menu_link_for "estancia"
      click_the_action_link_for "new"
      fill_in "estancia_cantidad", with: 1
      select episodio.id, from: "estancia_episodio_id"
      select tipo_4.concepto, from: "estancia_tipo_coste_con_tarifa_id" 
      find( :css, "button[name=_save]" ).click
      expect( Estancia.count ).to eql 1
    end
  end
end