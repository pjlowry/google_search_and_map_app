require 'uri'
require 'faraday'
require 'json'

body = {"results"=>[{"address_components"=>[{"long_name"=>"1715", "short_name"=>"1715", "types"=>["street_number"]}, {"long_name"=>"I Street", "short_name"=>"I St", "types"=>["route"]}, {"long_name"=>"Central Sacramento", "short_name"=>"Central Sacramento", "types"=>["neighborhood", "political"]}, {"long_name"=>"Sacramento", "short_name"=>"Sacramento", "types"=>["locality", "political"]}, {"long_name"=>"Sacramento", "short_name"=>"Sacramento", "types"=>["administrative_area_level_2", "political"]}, {"long_name"=>"California", "short_name"=>"CA", "types"=>["administrative_area_level_1", "political"]}, {"long_name"=>"United States", "short_name"=>"US", "types"=>["country", "political"]}, {"long_name"=>"95811", "short_name"=>"95811", "types"=>["postal_code"]}], "formatted_address"=>"1715 I Street, Sacramento, CA 95811, USA", "geometry"=>{"location"=>{"lat"=>38.579016, "lng"=>-121.482753}, "location_type"=>"ROOFTOP", "viewport"=>{"northeast"=>{"lat"=>38.58036498029149, "lng"=>-121.4814040197085}, "southwest"=>{"lat"=>38.57766701970849, "lng"=>-121.4841019802915}}}, "types"=>["street_address"]}], "status"=>"OK"} 

# results= body['results'].first['geometry']['location']
# ß@lat = results['lat']
# ß@lng = results['lng']
