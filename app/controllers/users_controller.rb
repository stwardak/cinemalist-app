class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    @user = current_user
    render :show
  end


  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      profile_visibility: params[:profile_visibility]
    )
    if user.save
      user.profile.update(avatar: params[:avatar])
      jwt = JWT.encode(
        {
          user_id: user.id,
          exp: 24.hours.from_now.to_i
        },
        Rails.application.credentials.fetch(:secret_key_base),
        "HS256"
      )
      render json: { jwt: jwt, username: user.username, email: user.email, user_id: user.id }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = current_user
    @user.update(
      username: params[:username] || @user.username,
      email: params[:email] || @user.email,
      password_digest: params[:password_digest] || @user.password_digest,
      profile_visibility: params[:profile_visibility] || @user.profile_visibility
    )
    if @user.save
      render json: { message: "User updated successfully" }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    @user.profile.destroy
    render json: { message: "Account has been successfully deleted" }
  end


  def watched_movies_this_year
    watched_movies.where("created_at >= ?", Date.current.beginning_of_year).count
  end
  
end
