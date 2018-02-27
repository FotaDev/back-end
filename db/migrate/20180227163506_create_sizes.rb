class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.belongs_to :ordered_item, index: true
      t.integer :size_id
      t.integer :style_id
      t.integer :size
    end
  end
end
