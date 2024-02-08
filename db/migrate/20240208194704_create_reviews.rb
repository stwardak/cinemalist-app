class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
