class User < ApplicationRecord
  has_secure_password
  
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :tasks
  has_many :categories, through: :tasks
  
  # def group_names=(name)
  #     group = Group.find_or_create_by(name: group_name)
  #     if !self.group.include?(group)
  #       self.groups << group
  #     end
  # end
  
  # def group_names
  #   self.groups
  # end

  def category_array
    self.tasks.map do |task|
      task.category
    end
  end
end
