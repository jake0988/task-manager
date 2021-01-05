class DropGroupusers < ActiveRecord::Migration[6.0]
  def change
    drop_table :group_users
  end
end
