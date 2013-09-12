class AddUniqueIndexGroceryListsUsers < ActiveRecord::Migration
  def change
    add_index(:grocery_lists_users, [:grocery_list_id, :user_id], :unique => true)
  end
end
