class Api::V1::SessionsController < Api::V1::ApplicationController
  def create
    @user.update(section: SecureRandom.uuid, section_expire: Time.current + Section::DEFAULT_EXPIRATION) if @user.section.nil?
    session[:section] = @user.section
    render json: {section: @user.section}
  end

  def logout
    @user.update(section: nil, section_expire: nil)
    @user = nil
    session[:section] = nil
  end
end
