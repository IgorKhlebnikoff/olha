class ReviewsController < ApplicationController
  before_filter :find_product

  def index
    @reviews = @product.reviews.reverse
  end

  def new
    @review = @product.reviews.build
  end

  def create
    @review = @product.reviews.build(review_params.merge(user_id: current_user.id))
    render action: :new unless @review.save
  end

  def destroy
    @review = @product.reviews.find(params[:id])
    @review.destroy
  end

  private

  def find_product
    @product = Product.find_by_id(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:body, :product_id, :user_id)
  end
end
