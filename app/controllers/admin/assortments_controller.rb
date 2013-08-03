class Admin::AssortmentsController < ApplicationController
  before_filter :find_assortsment, only: [:destroy, :edit, :update]
  before_filter :categories, only: [:new, :edit]

  def index
    @assortments = Kaminari.paginate_array(Assortment.all)
      .page(current_page(params[:assortment_page])).per(Constants::PER_PAGE)
  end

  def new
    @assortment = Assortment.new
  end

  def create
    category = Category.find_by_id(params[:category_id])
    if category
      @assortment = Assortment.new(params[:assortment])
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
    unless @assortment.update_attributes(params[:assortment])
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

end
