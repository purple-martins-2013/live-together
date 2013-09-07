class CreateGroceryLists < ActiveRecord::Migration
  def change
    create_table :grocery_lists do |t|
      t.string :name
      t.integer :house_id
      t.timestamps
    end
  end
end
