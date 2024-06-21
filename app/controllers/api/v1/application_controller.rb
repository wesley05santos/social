class Api::V1::ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_action :authorize_user

  private

  def authorize_user
    return render json: {}, status: :unauthorized unless authenticate_with_http_basic { |user, password| User.find_by(email: user).valid_password?(password) }
  end
end
