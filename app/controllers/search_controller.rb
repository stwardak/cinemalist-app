class SearchController < ApplicationController
  def query
    if params[:q].present?
      @movies = Movie.where("title ILIKE ?", "%#{params[:q]}%")
      render json: @movies
    else
      render json: { error: "No query provided" }, status: :unprocessable_entity
    end
  end
end

