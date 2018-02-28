class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.belongs_to :style, index: true
      t.string :details
    end
  end
end
