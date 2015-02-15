class ProductsController < ApplicationController
  before_filter :find_product, only: [:show]

  def index
    @products = DataFormater.new.paginate(Product, params[:product_page])
  end

  def show
    @variants = @product.variants
    @reviews  = @product.reviews.reverse
    @review   = @product.reviews.new
  end

  def rate
    @product.rate(params[:stars], current_user, params[:dimension])
    render :show do |page|
      page.replace_html @product.wrapper_dom_id(params), ratings_for(@product, params.merge(wrap: false))
      page.visual_effect :highlight, @product.wrapper_dom_id(params)
    end
  end

  private

  def find_product
    @product = Product.find_by_id(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :assortment_id, variants_attributes: [:price, :color_id, :size_id, :in_stock])
  end

  def rate_params
    params.require(:rate).permit(:rate, :dimension)
  end
end
