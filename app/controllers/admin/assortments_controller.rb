class Admin::AssortmentsController < ApplicationController
  before_filter :find_assortsment, only: [:destroy, :edit, :update]
  before_filter :categories, only: [:new, :edit]

  def index
    @assortments = DataFormater.new.paginate(Assortment, params[:assortment_page])
  end

  def new
    @assortment = Assortment.new
  end

  def create
    category = Category.find_by_id(params[:category_id])
    if category
      @assortment = Assortment.new(assortment_params)
      category.assortments << @assortment
      unless @assortment.valid?
        categories
        render action: :new
      end
    else
      flash[:error] = I18n.t('controllers.admin.assortments.category_not_found')
    end
  end

  def update
    unless @assortment.update_attributes(assortment_params)
      render action: :edit
    end
  end

  def destroy
    @assortment.destroy
  end

  private

  def find_assortsment
    @assortment = Assortment.find_by_id(params[:id])
  end

  def categories
    @categories = Category.all
  end

  def assortments
    @assotrments = Assortment.all
  end

  def assortment_params
    params.require(:assortment).permit(:name, :category_id, category_attributes: [:name])
  end

end
