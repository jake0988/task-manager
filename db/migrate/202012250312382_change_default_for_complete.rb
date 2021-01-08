class ChangeDefaultForComplete < ActiveRecord::Migration[6.0]
  def up
    change_column_default :tasks, :complete, false
    change_column_default :group_tasks, :complete, false
  end

  def down
    change_column_default :tasks, :complete, true
    change_column_default :group_tasks, :complete, true
  end
end