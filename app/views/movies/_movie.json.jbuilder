json.id movie.id
json.title movie.title
json.description movie.description
json.year movie.year
json.image_url movie.image_url
json.director movie.director
json.genres movie.genres.pluck(:genre)
json.favorites movie.favorites.count
json.saved_movies movie.saved_movies.count
json.watched_movies movie.watched_movies.count
json.reviews movie.reviews
json.reviews_count movie.reviews.count

json.reviews movie.reviews do |review|
  json.id review.id
  json.created_at review.created_at
  json.updated_at review.updated_at
  json.rating review.rating
  json.title review.title
  json.avatar review.user.profile.avatar
  json.content review.content
  json.user review.user.username
  
end
