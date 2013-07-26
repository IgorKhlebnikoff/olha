class Admin::CategoriesController < ApplicationController
  before_filter :find_category, only: [:edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(params[:category])
  end

  def update
    @category.update_attributes(params[:category])
  end

  def destroy
    @category.destroy
  end

  private

  def find_category
    @category = Category.find_by_id(params[:id])
  end
end
