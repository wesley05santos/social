class UsersController < ApplicationController
  def follow
    @user_to_follow = User.find(params[:user_id])
    current_user.followings << @user_to_follow
  end

  def unfollow
    @user_to_unfollow = User.find(params[:user_id])
    current_user.followings.delete(@user_to_unfollow)
  end
end
