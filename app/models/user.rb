class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :email, presence: true, uniqueness: true
  after_create :create_profile
  

  has_one :profile
  has_many :favorites
  has_many :movies, through: :favorites
  has_many :watched_movies
  has_many :movies, through: :watched_movies
  has_many :saved_movies
  has_many :movies, through: :saved_movies
  has_many :reviews
  has_many :movies, through: :reviews
  
  def create_profile
    Profile.create(user: self)
  end

end
