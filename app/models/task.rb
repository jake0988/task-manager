class Task < ApplicationRecord
  has_many :users
  belongs_to :category
  belongs_to :group
  validates_presence_of :name


 
  def category_attributes=(name)
    self.category = Category.find_or_create_by(:name => name)
    self.category.update(name)
  end

  def category_attributes
    self.category ? self.category.name : nil
  end

  def group_attributes=(name)
    self.group = Group.find_or_create_by(:name => name)
    self.group.update(name)
  end

  def group_attributes
    self.group ? self.group.name : nil
  end
end
