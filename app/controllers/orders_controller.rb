class OrdersController < ApplicationController

  private

  def order_params
    params.require(:order).permit(:quantity, :user_id)
  end
end
