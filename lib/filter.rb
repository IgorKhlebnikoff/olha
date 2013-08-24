class Filter
  def initialize(data, filter_params)
    @data = data
    @filter_by = filter_params[:by]
    @param = filter_params[:param]
  end

  def execute
    @data.filter_by(@filter_by, @param)
  end
end
