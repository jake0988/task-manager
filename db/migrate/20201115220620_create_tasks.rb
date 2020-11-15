class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :comment
      t.boolean :complete
      t.string :note
      t.string :name
      t.datetime :start_time
      t.datetime :time_for_completion
      t.belongs_to :group, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
