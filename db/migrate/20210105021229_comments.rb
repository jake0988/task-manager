class Comments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :task_id
      t.integer :group_task_id
    end
  end
end
