Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # User Routes
  get "/users" => "users#index" # view list of all users
  get "/users/:id" => "users#show" # view user's own details
  post "/users" => "users#create" # create a new user / a user can sign up
  patch "/users/:id" => "users#update" # user can edit their login information and settings
  delete "/users/:id" => "users#destroy" # allow users to delete their account

  # Profile Routes
  get "/profiles/:user_username" => "profiles#show" # a user can view another user's profile
  patch "/profiles/:user_id" => "profiles#update" # a user can change their profile picture
  # create profile happens automatically upon signing up
  # no destroy action needed, profile deleted with user destroy method
  get "/avatar_options" => "profiles#avatar_options"

  # Relationship Routes
  get "/users/:user_id/followers" => "relationships#followers" # view a user's followers
  get "/users/:user_id/following" => "relationships#following" # view a user's followed users
  post "/relationships" => "relationships#create" # follow a user 
  delete "/relationships" => "relationships#destroy" # unfollow a user

  # Movie Routes
  get "/movies" => "movies#index" # a user can view all movies
  get "/movies/:id" => "movies#show" # a user can view a specific movie

  # Director Routes
  get "/directors" => "directors#index" # a user can view all directors
  get "/directors/:id(/:name)" => "directors#show" # a user can view movies by a specific director 

  # Genre Routes
  get "/genres" => "genres#index" # a user can browse movies by genre
  get "/genres/:id/(/:genre)" => "genres#show" # a user can view all movies in a genre

  # Favorite Routes
  get "users/:user_id/favorites" => "favorites#index" # a user can view their favorites
  post "users/:user_id/favorites" => "favorites#create" # a user can add a movie to their favorites
  delete "/favorites/:id" => "favorites#destroy" # a user can remove a movie from their favorites

  # Sessions Routes
  post "/sessions" => "sessions#create" # user login session

  # Saved Movies (aka Watchlist) Routes
  get "/users/:user_id/watchlist" => "saved_movies#index" # a user can view their watchlist
  post "/users/:user_id/watchlist" => "saved_movies#create" # a user can add a movie to their watchlist
  delete "/watchlist/:id" => "saved_movies#destroy" # a user can remove a movie from watchlist

  # Watched Movies (aka Seen It) Routes
  get "/users/:user_id/seen-it" => "watched_movies#index" # a user can view their watched movies
  post "/users/:user_id/seen-it" => "watched_movies#create" # a user can add a movie to their watched movies list
  delete "/seen-it/:id" => "watched_movies#destroy" # a user can remove a movie from there seen-it list


  # Reviews Routes
  get "/movies/:movie_id/reviews" => "reviews#index" # a user can view all reviews for a movie
  get "/users/:user_id/reviews" => "reviews#show" # a user can see reviews they've posted
  post "/movies/:movie_id/reviews" => "reviews#create" # a user can add a review to a movie
  patch "/users/:user_id/reviews/:id" => "reviews#update" # a user can edit their review
  delete "/users/:user_id/reviews/:id" => "reviews#destroy" # a user can delete their own review

  # Search Route
  get "/search", to: "search#query"

end
