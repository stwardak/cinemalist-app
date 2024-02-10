class DirectorsController < ApplicationController
  def index
    director_ids = [ 1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 13, 14, 16, 17, 18, 79, 132, 3168, 2935 ]
    @directors = Director.where(id: director_ids)
    render :index
  end

  def show
    @director = Director.find(params[:id])
    @movies = @director.movies
    render :show
  end

end
 

