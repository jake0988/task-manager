class Task < ApplicationRecord
  belongs_to :group
  belongs_to :category
  has_many :users, through: :group
  accepts_nested_attributes_for :category
end
