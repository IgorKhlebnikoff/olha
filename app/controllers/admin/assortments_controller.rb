class Admin::AssortmentsController < ApplicationController
  def new
    @assortment = Assortment.new
  end

  def create
    Assortment.create(params[:assortment])
  end

  def destroy
    Assortment.find_by_id(params[:id]).destroy
  end
end
