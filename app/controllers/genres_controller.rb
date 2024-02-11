class GenresController < ApplicationController
  def index
    @genres = Genre.all
    render :index
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = @genre.movies.where('popularity > ?', 50).order('RANDOM()').limit(50)
    #only shows 50 movies that have a popularity score of over 50, random order
    render :show
  end
end
