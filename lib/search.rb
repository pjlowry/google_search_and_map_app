class Search
  include ActiveModel::Validations
  attr_reader :search_latitude, :search_longitude, :address, :radius, :keyword
  
  validates :radius, :length => { :maximum => 4 }
  validates :radius, :keyword, :address, :presence => true

  def initialize(options)
    @radius = options[:radius]
    @keyword = options[:keyword]
    @address = options[:address]

    address_uri = URI.encode_www_form({'address' => "#{@address}", 'sensor' => SENSOR})
    get_response = Faraday.get { |request| request.url "http://maps.google.com/maps/api/geocode/json?#{address_uri}" }
    body = JSON.parse(get_response.body)
    results = body['results'].first['geometry']['location']
    @search_latitude = results['lat']
    @search_longitude = results['lng']
    location = "#{@search_latitude},#{@search_longitude}"
    @required = URI.encode_www_form({'location' => location, 'keyword' => @keyword, 'radius' => @radius, 'sensor' => SENSOR, 'key' => KEY})

  end

  def results
    get_response = Faraday.get { |request| request.url "https://maps.googleapis.com/maps/api/place/nearbysearch/json?#{@required}" }

    body = JSON.parse(get_response.body)

    results = body['results'].inject([]) { |results, place| results << Result.new(:name => place['name'], :address => place['vicinity'], :lat => place['geometry']['location']['lat'].to_s, :lng => place['geometry']['location']['lng'].to_s) }
  end
end
