class CreateSettlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|
      t.references :user
      t.integer :amount_cents, :default => 0
      t.references :grocery_list
      t.references :expense
      t.date :date_paid
      t.timestamps
    end
  end
end
