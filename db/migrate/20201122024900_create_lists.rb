class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :item
      t.integer :calories
      t.integer :price

      t.timestamps
    end
  end
end
