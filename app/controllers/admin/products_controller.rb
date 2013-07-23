class Admin::ProductsController < ApplicationController
  before_filter :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(params[:product])
  end

  def update
    @product.update_attributes(params[:product])
  end

  def destroy
    @product.destroy
  end

  private

  def find_product
    @product = Product.find_by_id(params[:id])
  end
end
