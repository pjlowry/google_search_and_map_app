require 'uri'
require 'faraday'
require 'json'

# destination = "#{@lat},#{@lng}"
# @required = URI.encode_www_form({'origin' => "38.578836,-121.48343", 'destination' => "38.568586,-121.499856", 'sensor' => "false"})

# p get_response = Faraday.get { |request| request.url "http://maps.googleapis.com/maps/api/directions/json?#{@required}" }
# body = JSON.parse(response.body)
body = {"routes"=>[{"bounds"=>{"northeast"=>{"lat"=>38.57956, "lng"=>-121.48343}, "southwest"=>{"lat"=>38.56636, "lng"=>-121.49988}}, "copyrights"=>"Map data \u00A92013 Google", "legs"=>[{"distance"=>{"text"=>"1.6 mi", "value"=>2536}, "duration"=>{"text"=>"8 mins", "value"=>467}, "end_address"=>"901 U Street, Sacramento, CA 95818, USA", "end_location"=>{"lat"=>38.56852000000001, "lng"=>-121.49988}, "start_address"=>"1630 I Street, Sacramento, CA 95814, USA", "start_location"=>{"lat"=>38.57884000000001, "lng"=>-121.48343}, "steps"=>[{"distance"=>{"text"=>"0.2 mi", "value"=>243}, "duration"=>{"text"=>"1 min", "value"=>66}, "end_location"=>{"lat"=>38.57956, "lng"=>-121.48607}, "html_instructions"=>"Head <b>west</b> on <b>I St</b> toward <b>16th St</b>", "polyline"=>{"points"=>"w|mjFlfndVkAhGcAdG"}, "start_location"=>{"lat"=>38.57884000000001, "lng"=>-121.48343}, "travel_mode"=>"DRIVING"}, {"distance"=>{"text"=>"1.0 mi", "value"=>1550}, "duration"=>{"text"=>"4 mins", "value"=>261}, "end_location"=>{"lat"=>38.56636, "lng"=>-121.4918}, "html_instructions"=>"Turn <b>left</b> at the 2nd cross street onto <b>15th St</b>", "polyline"=>{"points"=>"ganjF|vndVhBl@nBn@lBn@pBp@hBl@nBn@NF~Af@`AZNF^LXJtAd@tAd@TFNF|Af@nBn@jBn@lBn@NDzAf@jBn@nBp@HB@?D@@?xAf@lBn@bBh@vBr@hBn@lBl@lBn@"}, "start_location"=>{"lat"=>38.57956, "lng"=>-121.48607}, "travel_mode"=>"DRIVING"}, {"distance"=>{"text"=>"0.5 mi", "value"=>743}, "duration"=>{"text"=>"2 mins", "value"=>140}, "end_location"=>{"lat"=>38.56852000000001, "lng"=>-121.49988}, "html_instructions"=>"Turn <b>right</b> onto <b>U St</b><div style=\"font-size:0.9em\">Destination will be on the right</div>", "polyline"=>{"points"=>"wnkjFvzodVeAhGgAhGsA~HeAdGiAlG}@fF"}, "start_location"=>{"lat"=>38.56636, "lng"=>-121.4918}, "travel_mode"=>"DRIVING"}], "via_waypoint"=>[]}], "overview_polyline"=>{"points"=>"w|mjFlfndVkAhGcAdGxE|AxL~DfLxDxPtFvL~DrLzDlBn@eAhG{ChQmEzV"}, "summary"=>"15th St and U St", "warnings"=>[], "waypoint_order"=>[]}], "status"=>"OK"}


p 
# routes = body['routes'].first
# legs = routes['legs'].first
# steps = legs['steps'].each do |step|
#   p step['html_instructions'].gsub(/<[^d>]*>/, "").gsub(/<[^>]*>/, ". ")
# end
 

body['routes'].first['legs'].first['steps'].inject([]) {|routes, step| routes << step['html_instructions'].gsub(/<[^d>]*>/, "").gsub(/<[^>]*>/, ". ") }
# legs = routes['legs'].first
# steps = legs['steps'].each do |step|
#   p step['html_instructions'].gsub(/<[^d>]*>/, "").gsub(/<[^>]*>/, ". ")
# end