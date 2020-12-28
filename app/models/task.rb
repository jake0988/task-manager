class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates_presence_of :name
  validates :name, uniqueness: {:message => "Task already exists"}

  scope :alpha, -> { order(:name) }

  def duplicate
    if self.user.tasks.include?(self)
      errors.add(name: "This task is already included in this category")
    end
  end
end