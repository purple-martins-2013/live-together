class AddUserToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :user_id, :integer
  end
end
