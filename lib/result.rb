class Result

  attr_accessor :name, :address 

  def initialize(options)
    @name = options[:name]
    @address = options[:address]
  end

  def ==(other)
    if other.class != self.class
      false
    elsif self.name == other.name && self.address == other.address
      true
    end
  end
end
