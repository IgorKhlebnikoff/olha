class Admin::ProductsController < ApplicationController
  before_filter :find_product, only: [:show, :edit, :update, :destroy]
  before_filter :all_assortments, :all_colors, :all_sizes, only: [:new, :edit, :update]

  def index
    @products = DataFormater.new.paginate(Product, params[:product_page])
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def show
    @colors
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to admin_product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
  end

  private

  def find_product
    @product = Product.find_by_id(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :assortment_id, variants_attributes: [:price, :color_id, :size_id, :in_stock, :picture])
  end

  def all_assortments
    @assortments = Assortment.all
  end

  def all_colors
    @colors = Color.all
  end

  def all_sizes
    @sizes = Size.all
  end

end
