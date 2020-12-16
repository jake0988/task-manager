class Group < ApplicationRecord
  has_many :tasks
  has_many :users, through: :tasks
  has_many :categories, through: :tasks
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_uniqueness_of :user_id
  validates_uniqueness_of :task_id

end
