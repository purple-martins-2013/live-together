class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :descrption
      t.integer :total_cents
      t.references :user
      t.date :purchased_on
      t.timestamps
    end
  end
end
