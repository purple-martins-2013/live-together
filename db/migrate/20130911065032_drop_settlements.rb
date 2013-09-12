class DropSettlements < ActiveRecord::Migration
  def change
    drop_table :settlements
  end
end
