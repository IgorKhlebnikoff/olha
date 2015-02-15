class Admin::ColorsController < ApplicationController
  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
  end

  def create
    Color.create(color_params)
  end

  def destroy
    Color.find_by_id(params[:id]).destroy
  end

  private

  def color_params
    params.require(:color).permit(:name)
  end
end
