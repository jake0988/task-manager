class Goal < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  # validates :name, uniqueness: true
  validate :user_goal_name_unique

  def user_goal_name_unique
    if self.group_id == nil
      user = User.find(user_id)
      if user.goals.name.include?(self.name)
        errors.add(:goal_id, "That name has already been taken")
      end
    end
  end

end