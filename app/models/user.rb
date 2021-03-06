class User < ApplicationRecord
  has_secure_password
  has_many :category_users
  
  has_many :goals
  has_many :tasks
  has_many :categories, through: :tasks
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :group_tasks, through: :groups
  validates_presence_of :username
  validates :username, uniqueness: :true
  accepts_nested_attributes_for :tasks


  scope :most_tasks, -> {left_joins(:tasks).group(:id).order('count(tasks.user_id) desc') }
  scope :most_unfinished_tasks, -> { most_tasks.where('complete = false').limit(1) }
  
end
