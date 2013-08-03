class Admin::CategoriesController < ApplicationController
  before_filter :find_category, only: [:edit, :update, :destroy]

  def index
    @categories = Kaminari.paginate_array(Category.all)
      .page(current_page(params[:category_page])).per(Constants::PER_PAGE)
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
    @category.destroy
  end

  private

  def find_category
    @category = Category.find_by_id(params[:id])
  end

end
