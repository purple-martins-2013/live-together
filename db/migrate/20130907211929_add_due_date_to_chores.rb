class AddDueDateToChores < ActiveRecord::Migration
  def change
    add_column :chores, :due_date, :date, default: Date.today
  end
end
