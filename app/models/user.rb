class User < ApplicationRecord
  has_secure_password
  # accepts_nested_attributes_for :group
  belongs_to :group
 
end
