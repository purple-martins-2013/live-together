class AddHouseToCompletedChores < ActiveRecord::Migration
  def change
    add_column :completed_chores, :house_id, :integer
  end
end
