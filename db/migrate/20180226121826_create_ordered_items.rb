class CreateOrderedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :ordered_items do |t|
      t.belongs_to :hire, index: true
      t.integer :size_id
      t.integer :request
      t.integer :booked
    end
  end
end
