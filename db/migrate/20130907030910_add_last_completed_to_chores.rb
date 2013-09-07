class AddLastCompletedToChores < ActiveRecord::Migration
  def change
    add_column :chores, :last_completed, :datetime
    add_column :chores, :points, :integer
  end
end
