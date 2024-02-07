class MoviesController < ApplicationController
  
  def index
    @movies = Movie.order(id: :asc)
    # @movies = Movie.all
    render :index
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    render :show
  end

end
