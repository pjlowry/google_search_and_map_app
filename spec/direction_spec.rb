require 'spec_helper'

describe Direction do 
  context 'readers' do 
    VCR.use_cassette('synopsis2') do
      direction = Direction.new(Result.new(:name => "Lucca Restaurant & Bar", :address => '1615 J Street, Sacramento', :lat => 38.578033, :lng => -121.4845), Search.new({:keyword => 'restaurant', :radius => '1', :latitude => 38.578836, :longitude => -121.48343}))
      #change to let

      it 'gives the directions to a destination' do 
        direction.routes.should eq ["Head south on 17th St toward I Street J St Alley", "Turn right onto K St", "Take the 1st right onto 16th St", "Turn right onto J St. Destination will be on the left. "]
      end

      it 'gives us the latitude' do
        direction.lat.should eq 38.578033
      end

      it 'gives us the longitude' do 
        direction.lng.should eq -121.4845
      end
    end
  end
end
