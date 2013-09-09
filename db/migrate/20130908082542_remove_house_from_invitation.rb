class RemoveHouseFromInvitation < ActiveRecord::Migration
  def change
    remove_column :invitations, :house_id
  end
end
