class CreateMultistocks < ActiveRecord::Migration[5.1]
  def change
    create_table :multistocks do |t|
      t.belongs_to :stock, index: true
      t.integer :actual_quantity
      t.timestamps
    end
  end
end
