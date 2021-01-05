class Comment < ApplicationRecord
  belongs_to :task, optional: true
  belongs_to :group_task, optional: true
end