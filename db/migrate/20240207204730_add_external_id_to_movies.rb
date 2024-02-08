class AddExternalIdToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :external_id, :integer
  end
end
