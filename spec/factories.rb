FactoryGirl.define do 
  factory :register do 
    name "Nuevo concepto"
    date Date.parse("31-12-2012")
    kind "ingreso"
    amount 200
  end

  factory :tag, :class => ActsAsTaggableOn::Tag do
    name "compras"
  end

  factory :supplier do
    name "Ramon Z."
    rfc "RZMSAF08"
  end
end