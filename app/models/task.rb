class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates_presence_of :name
  validate :task_name_unique_for_user
  scope :alpha, -> { order(:name) }

  def task_name_unique_for_user
    binding.pry
    user = User.find_by_id(self.user_id)
    user.tasks.select do |task|
      if task.name == self.name
        #Why does it add "Task" to error?
        errors.add(:task_id, "name already taken")
      end
    end
  end
end