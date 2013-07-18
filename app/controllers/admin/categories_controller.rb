class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    Category.create(params[:category])
  end

  def destroy
    Category.find_by_id(params[:id]).destroy
  end
end
