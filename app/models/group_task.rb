class GroupTask < ApplicationRecord
  belongs_to :goal, optional: true
  belongs_to :category
  belongs_to :group
  has_many :users, through: :group
  has_one :comment
  validates :name, presence: true
  validate :task_name_unique_for_group


  def task_name_unique_for_group
    group = Group.find_by_id(self.group_id)
    group.group_tasks.select do |task|
      if task.name == self.name
        #Why does it add "Task" to error?
        errors.add(:group_task_id, "name already taken")
      end
    end
  end
end
