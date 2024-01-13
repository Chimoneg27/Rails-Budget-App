class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates name
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  has_many :groups
  has_many :purchases, foreign_key: 'author_id'
end
