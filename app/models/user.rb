class User < ApplicationRecord
  has_secure_password
  
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :tasks
  has_many :categories, through: :tasks
  
  def group_name=(name)
    self.group = Group.find_or_create_by(name: group_name)
  end

  def group_name
    self.group ? self.group.name : nil
  end
 
end
