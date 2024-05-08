class HomeController < ApplicationController
  def index
    @articles = Article.all
  end

  def link_logout
    render 'shared/link_logout'
  end
end
