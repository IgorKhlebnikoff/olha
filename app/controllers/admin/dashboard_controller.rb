class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin?

  def index
    @categories = Category.all
    @assortments = Assortment.all
  end
end
