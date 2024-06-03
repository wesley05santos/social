class SearchController < ApplicationController
  def search_user
    @users = User.where("email ILIKE ?", "%#{params[:query]}%").where.not(id: current_user.id)
  end

  def search_article
    @articles = Article.where("title ILIKE ?", "%#{params[:query]}%")
  end
end
