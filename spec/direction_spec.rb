require 'spec_helper'

describe Direction do 
  context '#intialize' do 
    it 'initializes with an instance of the result object' do 
      direction = Direction.new(Result.new(:name => "Lucca Restaurant & Bar", :address => '1615 J Street, Sacramento', :lat => '38.578033', :lng => '-121.4845'))
      direction.should be_an_instance_of Direction
    end
  end

  context 'readers' do 
    it 'shows lat' do
      direction = Direction.new(Result.new(:name => "Lucca Restaurant & Bar", :address => '1615 J Street, Sacramento', :lat => '38.578033', :lng => '-121.4845'))
      direction.lat.should eq '38.578033'
    end
  end

  context 'readers' do 
    it 'shows lng' do
      direction = Direction.new(Result.new(:name => "Lucca Restaurant & Bar", :address => '1615 J Street, Sacramento', :lat => '38.578033', :lng => '-121.4845'))
      direction.lng.should eq '-121.4845'
    end
  end

end