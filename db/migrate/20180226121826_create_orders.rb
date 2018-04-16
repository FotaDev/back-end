class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :hire, foreign_key: true
      t.integer :request
      t.integer :booked
      t.timestamps
    end
  end
end