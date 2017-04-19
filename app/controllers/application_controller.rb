require 'jwt'

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_handler

  private

  def current_user
    token = request.headers["Authorization"] || access_token[:access_token]
    if !token.nil?
      begin
        payload = JWT.decode(token, nil, false)[0]
        @current_user ||= User.find(payload["id"])
      rescue
      end
    end
  end

  def authorize
    render status: 401 if current_user.nil?
  end

  def not_found_handler
    head 404
  end

  def access_token
    params.permit(:access_token)
  end
end
