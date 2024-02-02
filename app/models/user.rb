class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_many :favorites
  has_many :movies, through: :favorites
end
