class User < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :purchases, foreign_key: 'author_id', dependent: :destroy
end
