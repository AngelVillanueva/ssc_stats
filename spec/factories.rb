FactoryGirl.define do

  factory :usuario do
    email "gestor@clinicasantacristina.es"
    password "santacristina"
  end
  factory :compania do
    nombre "Factory de Compañía"
  end
  factory :tipo_coste_con_tarifa do
    concepto "Electrocardiograma"
  end
  factory :precio do
    importe 100
    vigencia Date.today.year.to_i
    incluido_en_forfait true
    compania
    tipo_coste_con_tarifa
  end

end