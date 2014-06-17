FactoryGirl.define do

  factory :usuario do
    email "gestor@clinicasantacristina.es"
    password "santacristina"
  end
  factory :precio do
    importe 100
    vigencia Date.today.year.to_i
    incluido_en_forfait true
  end

end