json.id @genre.id
json.genre @genre.genre

json.movies @movies do |movie|
  json.id movie.id
  json.title movie.title
  json.popularity movie.popularity
end