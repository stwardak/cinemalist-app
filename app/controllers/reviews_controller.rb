class ReviewsController < ApplicationController

  
  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
    # render :index
    render json: @reviews
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
    render json: @review
  end

  
  def create
    @review = Review.new(
      rating: params[:rating],
      title: params[:title],
      content: params[:content],
      user_id: current_user.id,
      movie_id: params[:movie_id]
    )
    if @review.save
      render :show
    else
      render json: {errors: @review.errors.full_messages}, status: :bad_request
    end
  end

  
    def destroy
      @review = Review.find_by(id: params[:id])
      if @review.present? && @review.user_id == current_user.id
         @review.destroy
         render json: {message: "review has been successfully deleted"}
      else
        render json: {error: "user cannot delete another user's review"}
      end
    end
  
end
