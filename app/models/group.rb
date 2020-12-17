class Group < ApplicationRecord
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :tasks
  has_many :categories, through: :tasks
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_uniqueness_of :user_id
  validates_uniqueness_of :task_id

end
