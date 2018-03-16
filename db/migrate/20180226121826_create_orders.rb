class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :hire, index: true
      t.integer :request
      t.integer :booked
      t.integer :item_id
      t.integer :size_id
      t.timestamps
    end
  end
end