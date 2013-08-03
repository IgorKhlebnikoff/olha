class Admin::AssortmentsController < ApplicationController
  before_filter :find_assortsment, only: [:destroy, :edit, :update]
  before_filter :fetch_categories, only: [:new, :edit]

  def new
    @assortment = Assortment.new
  end

  def create
    @assortment = Assortment.new(params[:assortment])
    unless @assortment.save
      categories
      render action: :new
    end
  end

  def update
    unless @assortment.update_attributes(params[:assortment])
      render action: :edit
    end
  end

  def destroy
    @assortment.destroy
    fetch_assortments
  end

  private

  def find_assortsment
    @assortment = Assortment.find_by_id(params[:id])
  end

  def fetch_categories
    @categories = Category.all
  end

  def fetch_assortments
    @assotrments = Assortment.all
  end
end
