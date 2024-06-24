class Api::V1::ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_action :authorize_user

  private

  def authorize_user
    section = session[:section]
    fetch_user if section
    return render json: {}, status: :unauthorized unless @user || authenticate_with_http_basic { |user, password| @user = User.find_by(email: user); @user.valid_password?(password) }

  end

  def fetch_user
    @user = User.where(section: session[:section]).first
  end
end
