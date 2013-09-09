class AddLastPurchasedToGroceryList < ActiveRecord::Migration
  def change
    add_column :grocery_lists, :last_purchased, :date
  end
end
