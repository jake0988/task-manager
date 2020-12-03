class User < ApplicationRecord
  has_secure_password
  
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :tasks
  has_many :categories, through: :tasks
  validates_presence_of :username


  def category_array
    self.tasks.map do |task|
      task.category
    end
  end
end
