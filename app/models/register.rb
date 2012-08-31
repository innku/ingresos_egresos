class Register < ActiveRecord::Base
  INCOME = 'ingreso'
  EGRESS = 'egreso'

  attr_accessible :date, :description, :amount, :folio, :name, :kind

  validates_presence_of :name, :date, :amount, :folio, :kind
  validates_inclusion_of :kind, in: [INCOME, EGRESS]
  validates_numericality_of :amount, greater_than: 0

  scope :by_created_at, order("created_at ASC")

  def income?
    kind == INCOME
  end
end
