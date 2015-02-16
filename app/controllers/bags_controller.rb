class BagsController < ApplicationController

  private

  def bag_params
    params.require(:bag).permit(:user_id)
  end
end
