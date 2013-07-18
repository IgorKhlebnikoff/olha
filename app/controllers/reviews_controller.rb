class ReviewsController < ApplicationController
  before_filter :find_product

  def index
    @reviews = @product.reviews
  end

  def new
    @review = @product.reviews.build
  end

  def create
    @review = @product.reviews.create(params[:review])
  end

  def destroy
    @review = @product.reviews.find(params[:id])
    @review.destroy
  end

  private

  def find_product
    @product = Product.find_by_id(params[:product_id])
  end
end
