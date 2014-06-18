FactoryGirl.define do

  factory :usuario do
    email "gestor@clinicasantacristina.es"
    password "santacristina"
  end
  factory :episodio do
    nhc 1111
    fecha_alta Date.today
  end
  factory :compania do
    nombre "Factory de Compañía"
  end
  factory :subtipo_coste do
    descripcion "Otros"
  end
  factory :tipo_coste_con_tarifa do
    concepto "Electrocardiograma"
    subtipo_coste
  end
  factory :tipo_coste_sin_tarifa do
    concepto "Producto sanitario"
    subtipo_coste
  end
  factory :precio do
    importe 100
    vigencia Date.today.year.to_i
    incluido_en_forfait true
    compania
    tipo_coste_con_tarifa
  end

end