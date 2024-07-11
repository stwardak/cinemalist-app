class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email]) || User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id,
          exp: 24.hours.from_now.to_i
        },
        Rails.application.credentials.fetch(:secret_key_base),
        "HS256"
      )
      render json: { jwt: jwt, user_id: user.id, username: user.username, avatar: user.profile.avatar }, status: :created
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
