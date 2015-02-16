class Admin::CategoriesController < ApplicationController
  before_filter :find_category, only: [:edit, :update, :destroy]

  def index
    @categories = DataFormater.new.paginate(Category, params[:category_page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    unless @category.save
      render action: :new
    end
  end

  def update
    unless @category.update_attributes(category_params)
      render action: :edit
    end
  end

  def destroy
    @category.destroy
  end

  private

  def find_category
    @category = Category.find_by_id(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end