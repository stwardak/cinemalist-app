class RenameCategoryIdToGenreIdInMovieGenres < ActiveRecord::Migration[7.0]
  def change
    rename_column :movie_genres, :category_id, :genre_id
  end
end
