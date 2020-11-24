class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :tasks
  has_many :categories, through: :tasks
end
