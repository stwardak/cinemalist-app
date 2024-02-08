class AddTmdbGenreIdToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :tmdb_genre_id, :integer
  end
end
