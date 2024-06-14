class Api::V1::ArticlesController < ActionController::API
  # before_action :fetch_article, only: %i[ update destroy ]

  def index
    @articles = Article.all
    # title, content, created_at (xx/xx/xxxx), user.email,
    # render json: @articles, status: :ok
    # render json: @articles.map{ |article| {
    #   title: article.title,
    #   content: article.content,
    #   user_email: article.user.email,
    #   created_at: article.created_at.strftime("%d/%m/%Y")
    #   }
    # }, status: :ok
  end

  def create
    @article = Article.create(article_params)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
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
