class SearchController < ApplicationController
  def index
    @users = User.where("email ILIKE ?", "%#{params[:query]}%").where.not(id: current_user.id)
  end
end
