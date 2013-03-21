class Direction
  attr_accessor :lat, :lng

  def initialize(result)
    @lat = result.lat
    @lng = result.lng
  end
end