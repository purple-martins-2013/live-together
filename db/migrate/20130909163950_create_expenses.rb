class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :purchaser

      t.string :name
      t.integer :total_cents

      t.string :description

      t.date :purchased_on
      t.timestamps
    end
  end
end
