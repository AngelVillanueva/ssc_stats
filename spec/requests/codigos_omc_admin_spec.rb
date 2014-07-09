require 'spec_helper'

describe "Códigos OMC management" do
  describe "authorized users should be able to do it" do
    let( :usuario ) { FactoryGirl.create( :usuario ) }
    let( :compania ) { FactoryGirl.create( :compania ) }
    let( :medico ) { FactoryGirl.create( :medico ) }
    let( :subtipo ) { FactoryGirl.create( :subtipo_coste, descripcion: "Quirófano" ) }
    let( :tipo ) { FactoryGirl.create( :tipo_coste_con_tarifa, concepto: "Sala de Partos", subtipo_coste: subtipo ) }
    let( :grupo ) { FactoryGirl.create( :grupo_quirurgico ) }
    let( :episodio ) { FactoryGirl.create( :episodio, compania: compania, medico: medico ) }
    let( :codigo_omc ) { FactoryGirl.create( :codigo_omc, grupo_quirurgico: grupo ) }
    let( :diagnostico ) { FactoryGirl.create( :diagnostico, episodio: episodio, tipo_coste_con_tarifa: tipo, codigo_omc: codigo_omc ) }
    before { go_dashboard_and_login }

    it "by seeing the link" do
      expect( page ).to have_css( "li[data-model=codigo_omc]" )
    end
    it "by clicking the link" do
      click_the_menu_link_for "codigo_omc"
    end
    it "by seeing the related Diagnosticos" do
      expect( episodio ).to be_valid
      expect( diagnostico ).to be_valid
      expect( codigo_omc ).to be_valid
      click_the_menu_link_for "codigo_omc"
      expect( page ).to have_css( "td.diagnosticos_field", text: diagnostico.id )
    end
    it "by seeing the related Grupo Quirúrgico" do
      expect( episodio ).to be_valid
      expect( grupo ).to be_valid
      expect( diagnostico ).to be_valid
      expect( codigo_omc ).to be_valid
      click_the_menu_link_for "codigo_omc"
      expect( page ).to have_css( "td.grupo_quirurgico_field", text: grupo.nombre )
    end
  end
end