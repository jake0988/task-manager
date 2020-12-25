class User < ApplicationRecord
  has_secure_password
  has_many :category_users
  
  has_many :goals
  has_many :tasks
  has_many :categories, through: :tasks
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :group_tasks, through: :groups
  validates_presence_of :username
  validates :username, uniqueness: :true
  accepts_nested_attributes_for :tasks


  # def group_cat_verify(group, category)
  #   binding.pry
  #   if !self.groups.include?(group)
  #     self.groups << group
  #   end
  #     if !self.groups.categories.include?(category)
  #     a = CategoryUser.new
  #     a.user_id = self.id
  #     a.category_id = category.id
  #     a.save
  # end
  
  # end
#Why doesn't this method work?
  # def category_verify(category)
  #  if !self.category_users.include?(category)
  #     binding.pry
  #   #   self.categories << category
  #   # end
  #   a = CategoryUser.new
  #   a.user_id = self.id
  #   a.category_id = category.id
  #   a.save
  #  end
  # end
  
  # def category_array
  #   self.tasks.map do |task|
  #     task.category
  #   end
  # end
end
