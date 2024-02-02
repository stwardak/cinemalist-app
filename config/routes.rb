Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 # Movie Routes
  get "/movies" => "movies#index"
  # get "/movies/:id" => "movies#show"
  # post "/movies" => "movies#create"
  # patch "/movies/:id" => "movies#update"
  # delete "/movies/:id" => "movies#destroy"


# # User Routes
#   get "/users" => "users#index"
#   get "/users/:id" => "users#show"
#   post "/users" => "users#create"
#   patch "/users/:id" => "users#update"
#   delete "/users/:id" => "users#destroy"

#   # Director Routes
#   get "/directors" => "directors#index"
#   get "/directors/:id" => "directors#show"
#   post "/directors" => "directors#create"
#   patch "/directors/:id" => "directors#update"
#   delete "/directors/:id" => "directors#destroy"

#   # Category Routes
#   get "/categories" => "categories#index"
#   get "/categories/:id" => "categories#show"
#   post "/categories" => "categories#create"
#   patch "/categories/:id" => "categories#update"
#   delete "/categories/:id" => "categories#destroy"

#   # Favorite Routes
#   get "/favorites" => "favorites#index"
#   get "/favorites/:id" => "favorites#show"
#   post "/favorites" => "favorites#create"
#   patch "/favorites/:id" => "favorites#update"
#   delete "/favorites/:id" => "favorites#destroy"


#   # Category_Movie Routes
#   get "/category_movies" => "category_movies#index"
#   get "/category_movies/:id" => "category_movies#show"
#   post "/category_movies" => "category_movies#create"
#   patch "/category_movies/:id" => "category_movies#update"
#   delete "/category_movies/:id" => "category_movies#destroy"

end
