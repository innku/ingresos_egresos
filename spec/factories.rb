FactoryGirl.define do 
  factory :register do 
    name "Nuevo concepto"
    folio "123"
    date Date.parse("31-12-2012")
    kind "ingreso"
    amount 200
  end

  factory :tag, :class => ActsAsTaggableOn::Tag do
    name "compras"
  end
end