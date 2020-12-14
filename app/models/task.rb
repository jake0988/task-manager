class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :group
  validates_presence_of :name


 
  def category_name=(name)
    self.category = Category.find_or_create_by(:name => name)
  end

  def category_name
    self.category ? self.category.name : nil
  end

  def group_name=(name)
    self.group = Group.find_or_create_by(:name => name)
  end

  def group_name
    self.group ? self.group.name : nil
  end
end
