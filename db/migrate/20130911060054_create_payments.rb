class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :borrower
      t.references :lender
      t.string :description
      t.integer :amount_cents, :default => 0
      t.timestamps
    end
  end
end
