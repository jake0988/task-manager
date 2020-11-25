class User < ApplicationRecord
  has_secure_password
  
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :tasks
  has_many :categories, through: :tasks
  
  def group_name=(name)
    self.group = Group.find_or_create_by(name: group_name)
  end

  def group_name
    self.group ? self.group.name : nil
  end
 
end
