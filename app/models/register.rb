class Register < ActiveRecord::Base
  attr_accessible :date, :description, :amount, :folio, :name, :kind
end
