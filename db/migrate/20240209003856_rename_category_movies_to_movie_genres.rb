class RenameCategoryMoviesToMovieGenres < ActiveRecord::Migration[7.0]
  def change
    rename_table :category_movies, :movie_genres
  end
end
