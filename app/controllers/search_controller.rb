class SearchController < ApplicationController
  def search_user
    @users = User.where("email ILIKE ?", "%#{params[:query]}%").where.not(id: current_user.id)
  end

  def search_article
    # Não é um modo performático

    # @articles = []
    # @types_search = ['title', 'content']
    # @types_search.each do |type|
    #   @articles << Article.where("#{type} ILIKE ?", "%#{params[:query]}%")
    # end
    # @articles = @articles.flatten


    #Está correto apenas modo diferente de se fazer
    # @articles = Article.where("title ILIKE :search_term OR content ILIKE :search_term", search_term: "%#{params[:query]}%")


    @articles = Article.where("title ILIKE ?", "%#{params[:query]}%").or(
      Article.where("content ILIKE ?", "%#{params[:query]}%")
    )

    render json: @articles
  end
end
