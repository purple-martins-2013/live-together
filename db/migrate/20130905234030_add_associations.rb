class AddAssociations < ActiveRecord::Migration
  def change
    add_column :users, :house_id, :integer
    add_column :chores, :house_id, :integer
  end
end
