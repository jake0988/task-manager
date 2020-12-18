class Task < ApplicationRecord
  has_many :task_users
  has_many :users, through: :task_users
  belongs_to :category
  belongs_to :group
  validates_presence_of :name
  validates_uniqueness_of :name, if: :group_cat_same

  def group_cat_same
    if task = Task.find_by(name: self.name)
    if self.group_id == task.group_id && self.category_id == task.category_id
      return true
    end
  end
    @error = "Task name must be unique within each Category of a Group"
    false
  end

  def category_attributes=(name)
    self.category = Category.find_or_create_by(:name => name)
    
    # self.category.update(name: name)
  end

  def category_attributes
    self.category ? self.category.name : nil
  end

  def group_attributes=(name)
    self.group = Group.find_or_create_by(:name => name)
    # self.group.update(name: name)
  end

  def group_attributes
    self.group ? self.group.name : nil
  end
end
