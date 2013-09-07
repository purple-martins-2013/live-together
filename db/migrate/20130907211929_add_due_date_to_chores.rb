class AddDueDateToChores < ActiveRecord::Migration
  def change
    add_column :chores, :due_date, :date
  end
end
