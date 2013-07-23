class Admin::SizesController < ApplicationController
  def index
    @sizes = Size.all
  end

  def new
    @size = Size.new
  end

  def create
    Size.create(params[:size])
  end

  def destroy
    Size.find_by_id(params[:id]).destroy
  end
end
