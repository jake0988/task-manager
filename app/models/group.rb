class Group < ApplicationRecord
  has_many :group_tasks
  has_many :group_users
  has_many :categories, through: :group_tasks
  has_many :users, through: :group_users
  has_many :tasks
  has_one :goal
  validates_presence_of :name
  validates_uniqueness_of :name
  
  
  
  def my_link_to(text, href)
    if !group_member
    flash[:message] = "Must be a part of group to view page" if self.users.include?(current_user)
    redirect_to request.referrer
    else 
      "<a href='#{href}'>#{text}</a>".html_safe
    end
  end

  def group_member?
    self.users.include?(@user)
  end

  
end
