class CreateSettlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|
      t.references :contributor
      t.references :expense

      t.integer :amount_cents, :default => 0
      t.date :date_paid

      t.timestamps
    end
  end
end
