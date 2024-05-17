class ReviewsController < ApplicationController
  before_action :find_user, only: [:create, :destroy]
  
  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
    render json: @reviews, include: :movie
  end

  def show
    @user = User.find(params[:user_id])
    @reviews = @user.reviews.includes(:movie)
    reviews_with_movie_details = @reviews.map do |review|
      {
        id: review.id,
        rating: review.rating,
        title: review.title,
        content: review.content,
        movie_id: review.movie.id,
        movie_title: review.movie.title,
        movie_year: review.movie.year,
        image_url: review.movie.image_url,
        updated_at: review.updated_at
      }
    end
    render json: reviews_with_movie_details
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


  def update
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
      @review.update(
        rating: params[:rating] || @review.rating,
        title: params[:title] || @review.title,
        content: params[:content] || @review.content,
        user_id: current_user.id,
      )
    end
    if @review.save
      render json: @review
    else
      render json: { errors: @review.errors.full_messages }, status: :bad_request
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    if @review.present? && @review.user_id == current_user.id
        @review.destroy
        render json: {message: "review has been successfully deleted"}
    else
      render json: {errors: @review.errors.full_messages}
    end
  end

end
