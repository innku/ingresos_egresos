class AddSupplierIdToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :supplier_id, :integer
  end
end
