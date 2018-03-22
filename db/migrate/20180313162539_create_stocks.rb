class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.references :item, index: true
      t.string :barcode
      t.string :make
      t.string :model
      t.integer :condition
      t.string :comments
      t.timestamps
    end
  end
end
