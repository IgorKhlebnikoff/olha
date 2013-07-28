class SearchesController < ApplicationController
  def index
    @results = Search.new(params[:search]).perform if params[:search]
  end

  def autocomplete
  end
end
