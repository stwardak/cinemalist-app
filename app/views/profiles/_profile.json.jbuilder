json.id profile.id
json.user_id profile.user_id
json.user_username  profile.user.username
json.avatar profile.avatar

json.favorites @user.favorites do |favorite|
  json.id favorite.id
  json.movie_id favorite.movie.id
  json.title favorite.movie.title
  json.image_url favorite.movie.image_url
end

json.reviews @user.reviews do |review|
  json.id review.id
  json.created_at review.created_at
  json.updated_at review.updated_at
  json.rating review.rating
  json.title review.title
  json.movie_title review.movie.title
  json.image_url review.movie.image_url
  json.content review.content
  json.movie_id review.movie_id
  json.movie_year review.movie.year
  
end
# json.watched_movies profile.user.watched_movies
# json.saved_movies profile.user.saved_movies
# json.reviews profile.user.reviews

# user stats
json.reviews_count profile.user.reviews.count
json.favorites_count profile.user.favorites.count
json.saved_movies_count profile.user.saved_movies.count
json.watched_movies_count profile.user.watched_movies.count


