class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.belongs_to :group, null: false, foreign_key: true
      t.boolean :admin

      t.timestamps
    end
  end
end
