class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :goup_details, dependent: :destroy
  has_many :groups, through: :group_details
end
