class AddGoalToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :goal, :string
  end
end
