class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :favorites
  has_many :movies, through: :favorites
end
