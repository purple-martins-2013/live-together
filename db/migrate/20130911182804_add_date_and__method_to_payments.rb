class AddDateAndMethodToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :date, :date
    add_column :payments, :method, :string
  end
end
