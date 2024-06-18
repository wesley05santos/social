class Api::V1::ArticlesController < ActionController::API
  # before_action :fetch_article, only: %i[ update destroy ]

  def index
    # @articles = Article.all
    @per_page = 5
    @total_pages = (Article.count.to_f / @per_page).ceil
    @current_page = (params[:current_page] || 1).to_i
    @current_page = 1 if params[:current_page].to_i > @total_pages
    @articles = Article.all
      .offset((@current_page - 1) * @per_page)
      .limit(@per_page)
    # respond_to do |format|
    #   format.json
    # end
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
