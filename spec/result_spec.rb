require 'spec_helper'


describe Result do 
  context '#intialize' do 
    it 'initializes with a hash of name and address' do 
      result = Result.new(:name => "Hacker Lab", :address => '1715 I Street, Sacramento, CA')
      result.should be_an_instance_of Result
    end
  end

  context 'readers' do 
    it 'shows name' do
      result = Result.new(:name => "Hacker Lab", :address => '1715 I Street, Sacramento, CA')
      result.name.should eq 'Hacker Lab'
    end

    it 'shows the latitude' do 
      result = Result.new(:name => "Hacker Lab", :address => '1715 I Street, Sacramento, CA', :lat => '38.577227', :lng => '-121.482326')
      result.lat.should eq '38.577227'
    end

    it 'shows the longitude' do 
      result = Result.new(:name => "Hacker Lab", :address => '1715 I Street, Sacramento, CA', :lat => '38.577227', :lng => '-121.482326')
      result.lng.should eq '-121.482326'
    end

    it 'shows address' do
      result = Result.new(:name => "Hacker Lab", :address => '1715 I Street, Sacramento, CA')
      result.address.should eq '1715 I Street, Sacramento, CA'
    end
  end

  context '#==' do  
    it 'two result objects are equal if there readers are the same' do  
      result1 = Result.new(:name => "Lucca Restaurant & Bar", :address => '1615 J Street, Sacramento', :lat => '38.5780330', :lng => '-121.48450')
      result2 = Result.new(:name => "Lucca Restaurant & Bar", :address => '1615 J Street, Sacramento', :lat => '38.5780330', :lng => '-121.48450')
      result1.should eq result2
    end
  end
end  