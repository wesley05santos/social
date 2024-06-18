json.current_page     @current_page
json.per_page         @per_page
json.total_pages      @total_pages
json.data @articles do |article|
  json.title          article.title
  json.content        article.content
  json.created_at     article.created_at.strftime("%d/%m/%Y")
  json.user do
    json.email article.user.email
  end
end
