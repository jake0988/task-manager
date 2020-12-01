module UsersHelper
  def group_names=(name)
    group = Group.find_or_create_by(name: group_name)
    if !self.group.include?(group)
      self.groups << group
    end
end

def group_names(user)
  user.groups
end
end
