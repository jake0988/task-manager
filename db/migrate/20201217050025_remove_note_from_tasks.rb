class RemoveNoteFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :note, :string
    remove_column :tasks, :start_time, :integer
    remove_column :tasks, :time_for_completion, :integer
  end
end
