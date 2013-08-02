class Admin::CategoriesController < ApplicationController
  before_filter :find_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    unless @category.save
      render action: :new
    end
  end

  def update
    unless @category.update_attributes(params[:category])
      render action: :edit
    end
  end

  def destroy
    if Assortment.find_by_category_id(@category.id)
      render :index
    else
      @category.destroy
    end
  end

  private

  def find_category
    @category = Category.find_by_id(params[:id])
  end

end
