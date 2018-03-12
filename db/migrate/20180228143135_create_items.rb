class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :description
      t.integer :size_id
      t.float :band_price
      t.float :sale_price
      t.boolean :saleable
      t.boolean :browseable
      t.boolean :has_stock
      t.string :category
      t.timestamps
    end
  end
end
