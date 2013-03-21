require 'rspec'
require 'faraday'
require 'json'
require 'webmock/rspec'
require 'active_model'
require 'user'
require 'search'
require 'result'
require 'direction'
require 'shoulda-matchers'
require 'vcr'


VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock 
end


SENSOR = 'false'
KEY = 'AIzaSyBb-c6luucnupLoXKbttAdF57ncuIgRBZs'

