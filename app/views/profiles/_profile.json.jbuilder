json.id profile.id
json.user_id profile.user_id
json.user_username  profile.user.username
json.avatar profile.avatar

# user stats
json.favorites_count @user.favorites.count
json.reviews_count @user.reviews.count
json.saved_movies_count @user.saved_movies.count
json.watched_movies_count @user.watched_movies.count
json.movies_count @user.watched_movies.count 
json.this_year_count @watched_movies_this_year
json.followers_count @followers_count
json.following_count @following_count

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





