class MoviesController < ApplicationController
  
  def index
    @movies = Movie.order(Arel.sql('RANDOM()')).limit(50)
    # random selection of 50 movies
    # @movies = Movie.all
    render :index
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    render :show
  end

end
