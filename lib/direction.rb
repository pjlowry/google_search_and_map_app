class Direction
  attr_accessor :lat, :lng, :routes

  def initialize(result, search)
    @lat = result.lat
    @lng = result.lng

    location = "#{search.latitude},#{search.longitude}"
    destination = "#{@lat},#{@lng}"
    required = URI.encode_www_form({'origin' => "#{location}", 'destination' => "#{destination}", 'sensor' => SENSOR})

    get_response = Faraday.get { |request| 
      request.url "http://maps.googleapis.com/maps/api/directions/json?#{required}"  
      request.headers['Accept'] = 'application/json'
    }
    body = JSON.parse(get_response.body)
    @routes = body['routes'].first['legs'].first['steps'].inject([]) {|routes, step| routes << step['html_instructions'].gsub(/<[^d>]*>/, "").gsub(/<[^>]*>/, ". ") }
  end
end



# "http://maps.googleapis.com/maps/api/directions/json?origin=38.578836%2C-121.48343&destination=38.678033%2C-121.5845&sensor=false"