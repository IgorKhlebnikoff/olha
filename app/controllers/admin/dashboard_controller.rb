class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin?

  def index
    data_formater = DataFormater.new
    @categories = data_formater.paginate(Category, params[:category_page])
    @assortments = data_formater.paginate(Assortment, params[:assortment_page])
    @products = Product.all
  end
end
