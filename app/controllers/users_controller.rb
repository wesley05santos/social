class UsersController < ApplicationController
  before_action :fetch_user

  def follow
    current_user.followings << @target_user

    respond_to { |format| format.turbo_stream }
  end

  def unfollow
    current_user.followings.delete(@target_user)

    respond_to { |format| format.turbo_stream }
  end

  private

  def fetch_user
    @target_user = User.find(params[:user_id])
  end

  def user_params
    params.require(:chat).permit(:photo)
  end
end
