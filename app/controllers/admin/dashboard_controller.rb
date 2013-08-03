class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin?

  def index
    @categories = Category.order('name').page(params[:page]).per(5)
    @assortments = Assortment.all
    @products = Product.all
  end
end
