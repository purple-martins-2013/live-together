class CreateCompletedChores < ActiveRecord::Migration
  def change
    create_table :completed_chores do |t|
      t.references :user
      t.references :chore
      t.datetime :completed_at

      t.timestamps
    end
  end
end
