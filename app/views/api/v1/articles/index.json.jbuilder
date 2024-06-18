json.current_page     @articles_pagination_data[:current_page]
json.per_page         @articles_pagination_data[:per_page]
json.total_pages      @articles_pagination_data[:total_pages]
json.data @articles_pagination_data[:objects] do |article|
  json.title          article.title
  json.content        article.content
  json.created_at     article.created_at.strftime("%d/%m/%Y")
  json.user do
    json.email article.user.email
  end
end
