class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name
      t.timestamps
    end
  end
end
