class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.date :date
      t.string :name
      t.decimal :amount
      t.string :folio
      t.text :description
      t.string :kind
      t.timestamps
    end
  end
end
