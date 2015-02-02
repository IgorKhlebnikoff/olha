class Search
  def initialize(model, term)
    @text = term
    @model = model
  end

  def execute
    @model.search(@term).results
  end
end
