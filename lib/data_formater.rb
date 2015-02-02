class DataFormater
  def paginate(model, page)
    Kaminari.paginate_array(model.all).page(current_page(page)).per(Constants::PER_PAGE)
  end

  private

  def current_page(page_param)
    page_param || 1
  end
end
