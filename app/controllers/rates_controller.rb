class RatesController < ApplicationController
  def create
    @product = Product.find(params[:id])
    @product.rate(rate_params)
    render :update do |page|
      page.replace_html @product.wrapper_dom_id(params), ratings_for(@product, params.merge(wrap: false))
      page.visual_effect :highlight, @product.wrapper_dom_id(params)
    end
  end

  private

  def rate_params
    params.require(:rate).permit(:rate, :dimension)
  end
end

