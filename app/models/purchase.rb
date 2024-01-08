class Purchase < ApplicationRecord
  belongs_to :user
  has_many :goup_details, dependent: :destroy
  has_many :groups, through: :group_details
end
