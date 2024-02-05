class FavoritesController < ApplicationController
  before_action :authenticate_user

  def index
    @favorites = Favorite.where(user_id: current_user.id)
    render :index
  end

  # def create
  #   @favorite = Favorite.create(
  #     user_id: current_user.id,
  #     movie_id: params[:movie_id]
  #   )
  #   render :show
  # end


end
