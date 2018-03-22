class CreateItemPacks < ActiveRecord::Migration[5.1]
  def change
    create_table :item_packs do |t|
      t.belongs_to :pack, index: true
      t.belongs_to :item, index: true
      t.integer :item_quantity
      t.timestamps
    end
  end
end
