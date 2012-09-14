class Supplier < ActiveRecord::Base

  validates_presence_of :name, :rfc
  attr_accessible :name, :rfc

  has_many :registers

  def self.suppliers_with_id_for_select
    Supplier.all.map do |supplier|
      [supplier.name, supplier.id]
    end
  end
  
end