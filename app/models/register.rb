class Register < ActiveRecord::Base
  INCOME = 'ingreso'
  EGRESS = 'egreso'

  attr_accessible :date, :description, :amount, :folio, :name, :kind

  validates_presence_of :name, :date, :amount, :folio, :kind
  validates_inclusion_of :kind, in: [INCOME, EGRESS]
  validates_numericality_of :amount, greater_than: 0

  def income?
    kind == INCOME
  end
end
