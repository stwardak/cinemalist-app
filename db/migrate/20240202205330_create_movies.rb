class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :rating
      t.integer :year
      t.string :image_url
      t.integer :director_id

      t.timestamps
    end
  end
end
