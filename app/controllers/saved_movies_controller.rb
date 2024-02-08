class SavedMoviesController < ApplicationController
  before_action :authenticate_user # user must be logged in to add to watchlist

  def index
    @saved_movies = SavedMovie.where(user_id: current_user.id)
    render :index
  end

  # def create
  #   if Favorite.exists?(user_id: current_user, movie_id:params[:movie_id])
  #     render json: { message: "Movie has already been added to favorites" }
  #   else
  #     @favorite = Favorite.create(
  #       user_id: current_user.id,
  #       movie_id: params[:movie_id]
  #     )
  #     render :show
  #   end
  # end

  # def destroy
  #   @favorite = Favorite.find_by(id: params[:id])
  #   if @favorite.present? && @favorite.user_id == current_user.id
  #     @favorite.destroy
  #     render json: {message: "Movie has been removed from your favorites"}
  #   else
  #     render json: {message: "Movie not found in current user's favorites"}
  #   end
  # end
end
