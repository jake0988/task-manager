class Group < ApplicationRecord
  has_many :tasks
  has_many :users, through: :tasks
  has_many :categories, through: :tasks
  validates :name, uniqueness: true
end
