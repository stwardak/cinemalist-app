class RelationshipsController < ApplicationController
  before_action :find_user, only: [:create, :destroy]

  def find_user
  @user = User.find(params[:followed_id])
  end

  def create
    current_user.follow(@user)
    render json: {message: "#{current_user.username} is now following #{@user.username}"}
  end

  def destroy
    current_user.unfollow(@user)
    render json: {message: "#{current_user.username} unfollowed #{@user.username}"}
  end

  def followers
    user = User.find(params[:user_id])
    @followers = user.followers
    render json: @followers
  end

  def following
    user = User.find(params[:user_id])
    @following = user.followed
    render json: @following
  end

end
