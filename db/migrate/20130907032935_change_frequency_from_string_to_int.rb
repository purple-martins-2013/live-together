class ChangeFrequencyFromStringToInt < ActiveRecord::Migration
  def change
    remove_column :chores, :frequency
    add_column :chores, :frequency, :integer
  end
end
