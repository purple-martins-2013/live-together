class CreateExpensesUsers < ActiveRecord::Migration
  def change
    create_table :expenses_users do |t|
      t.references :expense
      t.references :user
      t.timestamps
    end
  end
end

