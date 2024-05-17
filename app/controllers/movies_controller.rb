class MoviesController < ApplicationController
  
  def index
    @movies = Movie.where('popularity > ?', 50).order(Arel.sql('RANDOM()')).limit(48)     # random selection of 50 movies
    # @movies = Movie.all # all movies
    render :index
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    render :show
    # render json: @movie
  end

end
