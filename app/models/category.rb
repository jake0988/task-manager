class Category < ApplicationRecord
  has_many :tasks
  has_many :category_users
  has_many :users, through: :category_users
  has_many :groups, through: :tasks 
  validates :name, uniqueness: true
  validates_presence_of :name
end
