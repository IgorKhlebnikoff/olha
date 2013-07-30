class Admin::AssortmentsController < ApplicationController
  before_filter :find_assortsment, only: [:destroy, :edit, :update]
  before_filter :all_categories, only: [:new, :edit]

  def new
    @assortment = Assortment.new
  end

  def create
    @assortment = Assortment.create(params[:assortment])
  end

  def destroy
    @assortment.destroy
  end

  def update
    unless @assortment.update_attributes(params[:assortment])
      render action: :edit
    end
  end

  private

  def find_assortsment
    @assortment = Assortment.find_by_id(params[:id])
  end

  def all_categories
      @categories = Category.all
  end
  
end
