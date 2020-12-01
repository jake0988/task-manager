class User < ApplicationRecord
  has_secure_password
  
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :tasks
  has_many :categories, through: :tasks
  helper_method :tasks_array
  
  def group_name=(name)
    self.group = Group.find_or_create_by(name: group_name)
  end

  def group_name
    self.group ? self.group.name : nil
  end

  def category_array
    self.tasks.map do |task|
      task.category
    end

    def tasks_array
      self.tasks
    end
  end
 
end
