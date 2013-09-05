class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :title
      t.string :frequency
      t.timestamps
    end
  end
end
