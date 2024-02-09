class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(id: params[:user_id])
    render json: @profile
  end

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