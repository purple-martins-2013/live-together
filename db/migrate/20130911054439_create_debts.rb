class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.references :borrower
      t.references :lender
      t.references :expense
      t.integer :amount_cents, :default => 0
      t.timestamps
    end
  end
end
