class Register < ActiveRecord::Base
  attr_accessible :date, :description, :amount, :folio, :name, :kind

  validates_presence_of :name, :date, :amount, :folio, :kind
  validates_inclusion_of :kind, in: ["ingreso", "egreso"]
  validates_numericality_of :amount, greater_than: 0
end
