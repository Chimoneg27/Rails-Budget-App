class Group < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :icon, presence: true

  has_many :group_details, dependent: :destroy
  has_many :purchases, through: :group_details
end
