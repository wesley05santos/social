class Pagination
  def self.run(model, params)
    per_page = (params[:per_page] || 5).to_i
    total_pages = (model.count.to_f / per_page).ceil
    current_page = (params[:current_page] || 1).to_i
    current_page = 1 if params[:current_page].to_i > total_pages
    objects = model.all
      .offset((current_page - 1) * per_page)
      .limit(per_page)

    { per_page: ,total_pages: ,current_page: ,objects: }
  end
end
