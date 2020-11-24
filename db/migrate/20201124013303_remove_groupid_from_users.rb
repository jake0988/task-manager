class RemoveGroupidFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :group_id
  end
end
