class SearchesController < ApplicationController
  #skip_before_filter :check_profile
  before_filter :ensure_params_provided, only: :autocomplete

  def index
    @results = Search.new(Product, params[:term]).execute if params[:term]
  end

  def autocomplete
  end

  private

  def ensure_params_provided
    render(json:   { error: 'Bad request.' },
           status: :bad_request) unless params[:term].present?
  end
end
