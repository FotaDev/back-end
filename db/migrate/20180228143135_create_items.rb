class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.belongs_to :size, index: true
      t.string :description
      t.string :image_url
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
