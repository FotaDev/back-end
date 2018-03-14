class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :barcode
      t.integer :item_id
      t.integer :size_id
      t.string :make
      t.string :model
      t.integer :condition
      t.string :comments
      t.timestamps
    end
  end
end
