class ProductsController < ApplicationController
  before_filter :find_product, only: [:show]

  def index
    @products = Product.all
  end

  def show
    @variants = @product.variants
    @reviews  = @product.reviews.where("id is not null").reverse
    @review   = @product.reviews.build
  end

  private

  def find_product
    @product = Product.find_by_id(params[:id])
  end
end
