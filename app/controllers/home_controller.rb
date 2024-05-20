class HomeController < ApplicationController
  def index
    @articles = Article.all
  end

  def link_logout
    @enable_link_logout = 0 + params[:enable_link_logout].to_i
    respond_to do |format|
      format.turbo_stream {}
    end
    # return render 'shared/link_logout' if @enable_link_logout == 1

    # redirect_to root_path
  end
end
