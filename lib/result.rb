class Result

  attr_accessor :name, :address, :lat, :lng 

  def initialize(options)
    @name = options[:name]
    @address = options[:address]
    @lat = options[:lat]
    @lng = options[:lng]
  end

  def ==(other)
    if other.class != self.class
      false
    elsif self.name == other.name && self.address == other.address && self.lat == other.lat && self.lng == other.lng
      true
    end
  end
end
