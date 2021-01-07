class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates_presence_of :name
  validate :task_name_not_duplicate
  scope :alpha, -> { order(:name) }

  def task_name_not_duplicate
    task = Task.find_by(name: name, user_id: user_id)
      if !!task && task != self
      errors.add(self.name, "is already a task.")
    end
  end
end