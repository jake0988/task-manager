class RenameUserGroupsToGroupUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :user_groups, :group_users
  end
end
