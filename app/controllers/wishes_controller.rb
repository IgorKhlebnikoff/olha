class WishesController < ApplicationController
  before_filter :find_product, except: [:index]
  before_filter :wish, except: [:index]

  def index
    @wishes = current_user.wishes
  end

  def add
    outcome = @wish.push(@variant)
    flash[:notice] = outcome[:notice]
  end

  def remove
    outcome = @wish.delete(@variant)
    flash[:notice] = outcome[:notice]
  end

  private

  def find_product
    @variant = Variant.find_by_id(params[:wish_id])
  end

  def wish
    @wish = Wish.new(current_user)
  end
end
