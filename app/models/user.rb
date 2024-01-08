class User < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :purchases, dependent: :destroy
end
