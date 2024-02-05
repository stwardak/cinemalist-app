class UsersController < ApplicationController

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      profile_visibility: params[:profile_visibility]

    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
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
    render json: { message: "Account has been successfully deleted" }
  end

end
