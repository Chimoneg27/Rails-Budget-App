class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :amount, presence: true, numericality: true
  has_many :goup_details, dependent: :destroy
  has_many :groups, through: :group_details
end
