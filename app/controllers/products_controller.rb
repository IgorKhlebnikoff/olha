class ProductsController < ApplicationController
  before_filter :find_product, only: [:show]

  def index
    @products = Product.all
  end

  def show
    @variants = @product.variants
    @reviews  = @product.reviews.reverse
    @review   = @product.reviews.new
  end

  private

  def find_product
    @product = Product.find_by_id(params[:id])
  end
end
