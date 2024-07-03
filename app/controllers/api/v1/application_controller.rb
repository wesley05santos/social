class Api::V1::ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_action :authorize_user

  private

  def authorize_user
    binding.break
    fetch_user && check_section_expiration if session[:section]
    return render json: {}, status: :unauthorized unless @user || authenticate_with_http_basic { |user, password| @user = User.find_by(email: user); @user.valid_password?(password) }

  end

  def check_section_expiration
    if @user.section_expire < Time.current
      @user.update(section: nil, section_expire: nil)
      @user = nil
      session[:section] = nil
    end
  end

  def fetch_user
    @user = User.where(section: session[:section]).first
  end
end
