class CreateStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :styles do |t|
      t.string :description
      t.float :band_price
      t.float :sale_price
      t.boolean :saleable
      t.boolean :browseable
      t.boolean :has_stock
      t.string :category
    end
  end
end
