require 'jwt'

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_handler

  private

  def current_user
    if request.headers["Authorization"]
      payload = (JWT.decode request.headers["Authorization"], nil, false)[0]
      @current_user ||= User.find(payload["id"])
    end
  end

  def authorize
    render status: 401 if current_user.nil?
  end

  def not_found_handler
    head 404
  end
end
