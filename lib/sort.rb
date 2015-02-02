class Sort
  def initialize(data, field, direction)
    @data = data
    @field = field
    @direction = direction
  end

  def execute
    @data = @data.order("#{@field} #{@direction}")
  end
end
