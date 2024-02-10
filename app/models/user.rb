class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :email, presence: true, uniqueness: true
 
  after_create :create_profile
  has_one :profile
 
  def create_profile
    Profile.create(user: self)
  end

  has_many :favorites
  has_many :movies, through: :favorites

  has_many :watched_movies
  has_many :movies, through: :watched_movies

  has_many :saved_movies
  has_many :movies, through: :saved_movies

  has_many :reviews
  has_many :movies, through: :reviews

  has_many :followed_users, foreign_key: :follower_id, class_name: "Relationship"
  has_many :followed, through: :followed_users

  has_many :follower_users, foreign_key: :followed_id, class_name: "Relationship"
  has_many :followers, through: :follower_users
  
  def follow(other_user)
    followed << other_user unless self == other_user
  end

  def unfollow(other_user)
    followed.delete(other_user)
  end

  def following?(other_user)
    followed.include?(other_user)
  end


end
