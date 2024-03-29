class Movie < ApplicationRecord
  belongs_to :director, optional: true

  has_many :favorites
  has_many :users, through: :favorites

  has_many :movie_genres
  has_many :genres, through: :movie_genres

  has_many :reviews
  has_many :users, through: :reviews

  has_many :watched_movies
  has_many :users, through: :watched_movies

  has_many :saved_movies
  has_many :users, through: :saved_movies
end
