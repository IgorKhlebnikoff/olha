class Search
  def initialize(search_params)
    @text = search_params[:term]
    @filter = search_params[:filter_by]
    @sort = search_params[:sort_by]
  end

  def perform
    
  end
end
