class Admin::ColorsController < ApplicationController
  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
  end

  def create
    Color.create(params[:color])
  end

  def destroy
    Color.find_by_id(params[:id]).destroy
  end
end
