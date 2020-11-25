class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :tasks
  has_many :categories, through: :tasks
end
