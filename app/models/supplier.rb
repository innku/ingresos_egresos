class Supplier < ActiveRecord::Base

  validates_presence_of :name, :rfc
  attr_accessible :name, :rfc

  
end