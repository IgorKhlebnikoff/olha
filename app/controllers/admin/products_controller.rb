class Admin::ProductsController < ApplicationController
  before_filter :find_product, only: [:show, :edit, :update, :destroy]
  before_filter :all_assortments, only: [:new, :edit]

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
    unless @product.update_attributes(params[:product])
      render action: :edit
    end
  end

  def destroy
    @product.destroy
  end

  private

  def find_product
    @product = Product.find_by_id(params[:id])
  end
  
   def all_assortments
      @assortments = Assortment.all
  end
end
