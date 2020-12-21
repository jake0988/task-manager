class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

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
