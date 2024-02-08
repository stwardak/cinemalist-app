Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Movie Routes
  get "/movies" => "movies#index" # a user can view all movies
  get "/movies/:id" => "movies#show" # a user can view a specific movie
  # post "/movies" => "movies#create" # will only need for admin
  # patch "/movies/:id" => "movies#update" # will only need for admin
  # delete "/movies/:id" => "movies#destroy" # shouldn't need, unless for admin purposes


  # User Routes
  # get "/users" => "users#index" # view list of all users
  # get "/users/:id" => "users#show" # view specific user
  post "/users" => "users#create" # create a new user / a user can sign up
  patch "/users/:id" => "users#update" # user can edit their login information and settings
  delete "/users/:id" => "users#destroy" # allow users to delete their account

#   # Director Routes
#   get "/directors" => "directors#index" # a user can view all directors
#   get "/directors/:id" => "directors#show" # a user can view a specific director
#   post "/directors" => "directors#create" # shouldn't need, unless for admin purposes
#   patch "/directors/:id" => "directors#update" # shouldn't need, unless for admin purposes
#   delete "/directors/:id" => "directors#destroy" # shouldn't need, unless for admin purposes

#   # Category Routes
#   get "/categories" => "categories#index" # a user can browse movies by category
#   get "/categories/:id" => "categories#show" # a user can view all movies in a category
#   post "/categories" => "categories#create" # shouldn't need, unless for admin purposes
#   patch "/categories/:id" => "categories#update" # shouldn't need, unless for admin purposes
#   delete "/categories/:id" => "categories#destroy" # shouldn't need, unless for admin purposes

#   # Favorite Routes
  get "/favorites" => "favorites#index" # a user can view their favorites
#   get "/favorites/:id" => "favorites#show" # a user can view details for one of their favorites 
  post "/favorites" => "favorites#create" # a user can add a movie to their favorites
#   patch "/favorites/:id" => "favorites#update" # shouldn't need, unless for admin purposes
  delete "/favorites/:id" => "favorites#destroy" # a user can remove a movie from their favorites


#   # Category_Movie Routes
#   get "/category_movies" => "category_movies#index" # shouldn't need, unless for admin purposes
#   get "/category_movies/:id" => "category_movies#show" # shouldn't need, unless for admin purposes
#   post "/category_movies" => "category_movies#create" # shouldn't need, unless for admin purposes
#   patch "/category_movies/:id" => "category_movies#update" # shouldn't need, unless for admin purposes
#   delete "/category_movies/:id" => "category_movies#destroy" # shouldn't need, unless for admin purposes

  # Sessions Routes
  post "/sessions" => "sessions#create" # user login session

  # Saved Movies (aka Watchlist) Routes
get "/watchlist" => "saved_movies#index" # a user can view their watchlist
# get "/watchlist/:id" => "saved_movies#show" # a user can view details for a movie on their watchlist
post "/watchlist" => "saved_movies#create" # a user can add a movie to their watchlist
#   patch "/watchlist/:id" => "saved_movies#update" # shouldn't need, unless for admin purposes
delete "/watchlist/:id" => "saved_movies#destroy" # a user can remove a movie from watchlist

  # Watched Movies (aka Seen It) Routes
get "/seen-it" => "watched_movies#index" # a user can view their watched movies
# get "/seen-it/:id" => "watched_movies#show" # a user can view details for a movie they've seen
post "/seen-it" => "watched_movies#create" # a user can add a movie to their watched movies list
#   patch "/seen-it/:id" => "watched_movies#update" # shouldn't need, unless for admin purposes
delete "/seen-it/:id" => "watched_movies#destroy" # a user can remove a movie from there seen-it list


  # Reviews Routes

  get "/movies/:movie_id/reviews" => "reviews#index" # a user can view all reviews for a movie
#   get "/reviews/:id" => "reviews#show" # a user can view details for one of their reviews 
  post "/reviews" => "reviews#create" # a user can add a review to a movie
#   patch "/reviews/:id" => "reviews#update" # a user can edit their review
  delete "/reviews/:id" => "reviews#destroy" # a user can delete their own review


end
