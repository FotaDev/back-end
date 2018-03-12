class CreateHires < ActiveRecord::Migration[5.1]
  def change
    create_table :hires do |t|
      t.references :user, index: true
      t.datetime :collect_date
      t.datetime :return_date
      t.integer :status
      t.integer :band
      t.text :reference
      t.integer :invoice_number
      t.timestamps
    end
  end
end
