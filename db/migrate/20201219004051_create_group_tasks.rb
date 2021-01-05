class CreateGroupTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :group_tasks do |t|
      t.integer :group_id
      t.integer :category_id
      t.integer :goal_id
      t.string "comment"
      t.boolean "complete"
      t.string "name"

      t.timestamps
    end
  end
end
