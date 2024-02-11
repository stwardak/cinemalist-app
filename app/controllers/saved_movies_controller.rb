class SavedMoviesController < ApplicationController
  before_action :find_user, only: [:create, :destroy]

  def index
    @saved_movies = SavedMovie.where(user_id: current_user.id)
    render :index
  end

  def create
    if SavedMovie.exists?(user_id: current_user, movie_id:params[:movie_id])
      render json: { message: "Movie has already been added to your watchlist" }
    else
      @saved_movie = SavedMovie.create(
        user_id: current_user.id,
        movie_id: params[:movie_id]
      )
      render :show
    end
  end

  def destroy
    @saved_movie = SavedMovie.find_by(id: params[:id])
    if @saved_movie.present? && @saved_movie.user_id == current_user.id
      @saved_movie.destroy
      render json: {message: "Movie has been removed from your watchlist"}
    else
      render json: {message: "Movie not found in current user's watchlist"}
    end
  end
end
