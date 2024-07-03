class Api::V1::SessionsController < Api::V1::ApplicationController
  def create
    @user.authenticate! if @user.section.nil?
    session[:section] = @user.section
    render json: {message: "Login successfully"}
  end

  def destroy
    @user.update(section: nil, section_expire: nil)
    @user = nil
    session[:section] = nil
    render json: {message: "Logout successfully"}
  end
end
