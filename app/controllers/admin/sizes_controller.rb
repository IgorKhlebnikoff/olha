class Admin::SizesController < ApplicationController
  def index
    @sizes = Size.all
  end

  def new
    @size = Size.new
  end

  def create
    Size.create(size_params)
  end

  def destroy
    Size.find_by_id(params[:id]).destroy
  end

  private

  def size_params
    params.require(:size).permit(:name)
  end
end
