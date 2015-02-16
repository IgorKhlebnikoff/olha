class Admin::VariantsController < ApplicationController
  before_filter :find_product
  before_filter :find_variant, only: [:show, :edit, :update, :destroy]

  def index
    @variants = @product.variants
  end

  def new
    @variant = @product.variants.build
  end

  def create
    @variant = @product.variants.create(variant_params)
  end

  def update
    @variant.update_attributes(variant_params)
  end

  def destroy
    @variant.destroy
  end

  private

  def find_product
    @product = Product.find_by_id(params[:product_id])
  end

  def find_variant
    @variant = @product.variants.find_by_id(params[:id])
  end

  def variant_params
    params.require(:variant).permit(:price, :color_id, :size_id, :in_stock, :picture)
  end
end
