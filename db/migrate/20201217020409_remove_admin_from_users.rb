class RemoveAdminFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :admin, :boolean
    remove_column :users, :image, :string
  end
end
