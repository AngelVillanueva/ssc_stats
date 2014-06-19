# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections( :es ) do |inflect|
  inflect.clear

  inflect.plural(/$/, 's')
  inflect.plural(/([^aeéiou])$/i, '\1es')
  inflect.plural(/([aeiou]s)$/i, '\1')
  inflect.plural(/z$/i, 'ces')
  inflect.plural(/á([sn])$/i, 'a\1es')
  inflect.plural(/é([sn])$/i, 'e\1es')
  inflect.plural(/í([sn])$/i, 'i\1es')
  inflect.plural(/ó([sn])$/i, 'o\1es')
  inflect.plural(/ú([sn])$/i, 'u\1es')

  inflect.singular(/s$/, '')
  inflect.singular(/es$/, '')

  inflect.irregular('el', 'los')
end

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular('estancia', 'estancias')
  inflect.irregular('honorario_medico', 'honorarios_medicos')
  inflect.irregular('compania', 'companias')
  inflect.irregular('codigo_omc', 'codigos_omc')
  inflect.irregular('subtipo_coste', 'subtipos_coste')
  inflect.irregular('tipo_coste_con_tarifa', 'tipos_coste_con_tarifa')
  inflect.irregular('tipo_coste_sin_tarifa', 'tipos_coste_sin_tarifa')
  inflect.irregular('especialidad', 'especialidades')
  inflect.irregular('grupo_quirurgico', 'grupos_quirurgicos')
end

ActiveSupport::Inflector.inflections(:es) do |inflect|
  inflect.irregular('estancia', 'estancias')
  inflect.irregular('honorario_medico', 'honorarios_medicos')
  inflect.irregular('compania', 'companias')
  inflect.irregular('codigo_omc', 'codigos_omc')
  inflect.irregular('subtipo_coste', 'subtipos_coste')
  inflect.irregular('tipo_coste_con_tarifa', 'tipos_coste_con_tarifa')
  inflect.irregular('tipo_coste_sin_tarifa', 'tipos_coste_sin_tarifa')
  inflect.irregular('grupo_quirurgico', 'grupos_quirurgicos')
end
