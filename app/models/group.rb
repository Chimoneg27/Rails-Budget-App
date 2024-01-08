class Group < ApplicationRecord
  belongs_to :user
  has_many :group_details, dependent: :destroy
  has_many :purchases, through: :group_details
end
