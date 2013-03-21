class Search
  include ActiveModel::Validations
  attr_accessor :latitude, :longitude, :radius, :keyword
  
  validates :radius, :length => { :maximum => 4 }
  validates :latitude, :longitude, :radius, :keyword, :presence => true

  def initialize(options)
    @latitude = options[:latitude]
    @longitude = options[:longitude]
    @radius = options[:radius]
    @keyword = options[:keyword]

    location = "#{latitude},#{longitude}"
    @required = URI.encode_www_form({'location' => "#{location}", 'keyword' => @keyword, 'radius' => @radius, 'sensor' => SENSOR, 'key' => KEY})

  end

  def results
    get_response = Faraday.get { |request| request.url "https://maps.googleapis.com/maps/api/place/nearbysearch/json?#{@required}" }

    body = JSON.parse(get_response.body)

    results = body['results'].inject([]) { |results, place| results << Result.new(:name => place['name'], :address => place['vicinity'], :lat => place['geometry']['location']['lat'].to_s, :lng => place['geometry']['location']['lng'].to_s) }
  end
end