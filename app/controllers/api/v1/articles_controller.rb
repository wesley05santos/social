class Api::V1::ArticlesController < ActionController::API
  # before_action :fetch_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
    # binding.break
    render json: @articles, status: :ok
  end

  # private

  # def fetch_article
  #   @article = Article.find(params[:id])
  # end

  # def article_params
  #   params.require(:article).permit(:title, :content, :photo)
  # end
end
