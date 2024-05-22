class HomeController < ApplicationController
  def index
    @articles = Article.all
  end

  def link_logout
    @enable_link_logout = params[:enable_link_logout] == 'true' ? false : true
    respond_to do |format|
      format.turbo_stream {}
    end
  end
end
