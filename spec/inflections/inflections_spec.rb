require 'spec_helper'

describe "Spanish inflections" do
  it "test_plurales_que_terminar_en_n_o_s_con_acentos" do
    expect( 'avión'.pluralize(:es) ).to eql( 'aviones' )
    expect( 'interés'.pluralize(:es) ).to eql( 'intereses' )
  end
  it "para los nombres de las tablas" do
    expect( 'Episodio'.tableize ).to eql( 'episodios' )
    expect( 'Estancia'.tableize ).to eql( 'estancias' )
    expect( 'Diagnostico'.tableize ).to eql( 'diagnosticos' )
    expect( 'HonorarioMedico'.tableize ).to eql( 'honorarios_medicos' )
    expect( 'VariosConTarifa'.tableize ).to eql( 'varios_con_tarifas' )
    expect( 'VariosSinTarifa'.tableize ).to eql( 'varios_sin_tarifas' )
    expect( 'Compania'.tableize ).to eql( 'companias' )
    expect( 'Compañía'.pluralize ).to eql( 'Compañías' )
    expect( 'Medico'.tableize ).to eql( 'medicos' )
    expect( 'CodigoOmc'.tableize ).to eql( 'codigos_omc' )
    expect( 'Precio'.tableize ).to eql( 'precios' )
    expect( 'TipoCosteConTarifa'.tableize ).to eql( 'tipos_coste_con_tarifa' )
    expect( 'SubtipoCoste'.tableize ).to eql( 'subtipos_coste' )
    expect( 'TipoCosteSinTarifa'.tableize ).to eql( 'tipos_coste_sin_tarifa' )
    expect( 'GrupoQuirurgico'.tableize ).to eql( 'grupos_quirurgicos' )
  end
end