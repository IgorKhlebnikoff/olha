class Admin::VariantsController < ApplicationController
  before_filter :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @variants = Product.all
  end

  def new
    @variant = Product.create(params[:variant])
  end

  def create
    @variant = Product.create(params[:variant])
  end

  def update
    @variant.update_attributes(params[:variant])
  end

  def destroy
    @variant.destroy
  end

  private

  def find_product
    @variant = Product.find_by_id(params[:variant_id])
  end
end
