class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin?

  def index
    @categories = Kaminari.paginate_array(Category.all).page(current_page(params[:category_page])).per(Constants::PER_PAGE)
    @assortments = Kaminari.paginate_array(Assortment.all).page(current_page(params[:assortment_page])).per(Constants::PER_PAGE)
    @products = Product.all
  end
end
