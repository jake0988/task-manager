class GroupTask < ApplicationRecord
  belongs_to :goal, optional: true
  belongs_to :category
  belongs_to :group
  has_many :users, through: :group
  validates :name, presence: true
  validate :group_task_name_not_duplicate
  

  def group_task_name_not_duplicate
    task = GroupTask.find_by(name: name, group_id: group_id)
      if !!task && task != self
      errors.add(self.name, "is already a task.")
    end
  end
end
