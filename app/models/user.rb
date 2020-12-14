class User < ApplicationRecord
  has_secure_password
  has_many :tasks
  has_many :groups, through: :tasks
  has_many :categories, through: :tasks
  validates_presence_of :username
  validates :group, uniqueness: true
  accepts_nested_attributes_for :tasks


  def category_array
    self.tasks.map do |task|
      task.category
    end
  end
end
