require 'jwt'

class LoginController < ApplicationController
  def create
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      payload = {
        id: user.id,
        email: user.email,
        username: user.username
      }
      token = JWT.encode payload, nil, 'none'
      render json: {
        auth: token
      }, status: 201
    else
      render status: 400
    end
  end

  private
  def user_params
    params.permit(:email, :password)
  end
end
