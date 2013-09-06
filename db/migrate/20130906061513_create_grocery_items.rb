class CreateGroceryItems < ActiveRecord::Migration
  def change
    create_table :grocery_items do |t|
      t.string :name
      t.integer :grocery_list_id
      t.timestamps
    end
  end
end
