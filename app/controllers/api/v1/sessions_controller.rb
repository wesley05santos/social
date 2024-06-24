class Api::V1::SessionsController < Api::V1::ApplicationController
  def create
    @user.update(section: SecureRandom.uuid) if @user.section.nil?
    session[:section] = @user.section
    render json: {section: @user.section}
  end
end
