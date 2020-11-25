class RemoveGroupidFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :group_id
  end
end
