class Api::V1::ArticlesController < ActionController::API
  # before_action :fetch_article, only: %i[ update destroy ]

  def index
    @articles = Article.all
    render json: @articles, status: :ok
  end

  def create
    @article = Article.new(article_params)

    render json: @article, status: :ok if @article.save
  end

  def update
    @article = Article.find(params[:id])
    render json: @article, status: :ok if @article.update(article_params)
  end

  def destroy
    @article = Article.find(params[:id])
    render json: { message: 'Successfully Destroyed' }, status: :ok if @article.destroy!
  end

  private

  def fetch_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :photo, :user_id)
  end
end
