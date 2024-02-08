class WatchedMoviesController < ApplicationController
  before_action :authenticate_user # user must be logged in to add to watchlist

  def index
    @watched_movies = WatchedMovie.where(user_id: current_user.id)
    render :index
  end

  def create
    if WatchedMovie.exists?(user_id: current_user, movie_id:params[:movie_id])
      render json: { message: "Movie has already been added to your watchlist" }
    else
      @watched_movie = WatchedMovie.create(
        user_id: current_user.id,
        movie_id: params[:movie_id]
      )
      render :show
    end
  end

  def destroy
    @watched_movie = WatchedMovie.find_by(id: params[:id])
    if @watched_movie.present? && @watched_movie.user_id == current_user.id
      @watched_movie.destroy
      render json: {message: "Movie has been removed from your watched movies"}
    else
      render json: {message: "Movie not found in current user's watched movies"}
    end
  end
end
