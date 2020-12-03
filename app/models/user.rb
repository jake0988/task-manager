class User < ApplicationRecord
  has_secure_password
  
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :tasks
  has_many :categories, through: :tasks
  

  def group_name=(name)
    Group.find_or_create_by(name: name)
  end

  def group_name
    self.groups.where()
  end


  def category_array
    self.tasks.map do |task|
      task.category
    end
  end
end
