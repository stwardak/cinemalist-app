class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:user_username])
    if @user
      @profile = @user.profile

      # Calculate movies watched this year
      @watched_movies_this_year = @user.watched_movies.where("created_at >= ?", Date.current.beginning_of_year).count

      render :show
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  # def show
  #   # Find the user based on username
  #   user = User.find_by(username: params[:user_username])
    
  #   # If the user exists and has a profile, render the profile
  #   if user && user.profile
  #     @profile = user.profile
  #     render :show
  #   else
  #     render json: { error: "Profile not found" }, status: :not_found
  #   end
  # end
  

  def update
    @profile = current_user.profile
    @profile.avatar = params[:avatar] || @profile.avatar
    if @profile.save
      render json: @profile
    else
      render json: { errors: @profile.errors.full_messages }, status: :bad_request
    end
  end

  def avatar_options
    image_path = Rails.root.join("app", "assets", "images", "avatars")
    @avatars = Dir.children(image_path).select { |filename| filename.match(/\.(jpg|jpeg|png|gif)$/i) }
    render json: { avatars: @avatars }
  end

end