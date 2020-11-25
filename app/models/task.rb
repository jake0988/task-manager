class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :groups, through: :user
  accepts_nested_attributes_for :category
end
