class ReviewsController < ApplicationController
  before_action :find_user, only: [:create, :destroy]
  
  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
    # render :index
    render json: @reviews
  end

  def show
    @user = current_user
    @reviews = @user.reviews
    render json: @reviews
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
