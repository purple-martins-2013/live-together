class AddIndexes < ActiveRecord::Migration
  def change
    add_index(:grocery_items, [:name, :grocery_list_id], :unique => true)
    add_index(:grocery_lists, [:name, :house_id], :unique => true)
  end
end
