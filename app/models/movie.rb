class Movie < ApplicationRecord
  belongs_to :director
  has_many :favorites
  has_many :users, through: :favorites
  has_many :category_movies
  has_many :categories, through: :category_movies
end
