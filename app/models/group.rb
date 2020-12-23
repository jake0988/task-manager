class Group < ApplicationRecord
  has_many :group_tasks
  has_many :group_users
  has_many :categories, through: :group_tasks
  has_many :users, through: :group_users
  has_many :tasks
  has_many :goals, as: :achievable
  validates_presence_of :name
  validates_uniqueness_of :name

end
