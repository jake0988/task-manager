class Category < ApplicationRecord
  has_many :tasks
  has_many :users, through: :tasks
  has_many :group_tasks
  has_many :groups, through: :group_tasks 
  has_many :category_users
  validates :name, uniqueness: true
  validates_presence_of :name
end
