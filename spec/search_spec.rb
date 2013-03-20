require 'spec_helper'


describe Search do

  let(:options) {{}}
  let(:search) {Search.new(options)}

  context '#validations' do 
    it { search.should validate_presence_of :latitude}
    it { search.should validate_presence_of :longitude}
    it { search.should validate_presence_of :radius}
    it { search.should validate_presence_of :keyword} 
    it { search.should ensure_length_of(:radius).is_at_most(4)}
  end

  context '#results' do 
    it 'returns an array of result objects containing info about the surrounding places from a keyword and radius' do
      VCR.use_cassette('synopsis') do
        search = Search.new({:keyword => 'restaurant', :radius => '1', :latitude => '38.578836', :longitude => '121.48343'})
        search.results.should match_array [Result.new(:name => "Lucca Restaurant & Bar", :address => '1615 J Street, Sacramento'), Result.new(:name => "Michelangelo's Restaurant", :address => '1725 I Street, Sacramento'), Result.new(:name => "Streets of London Pub", :address => '1804 J Street, Sacramento'), Result.new(:name => "Bread Store", :address => '1716 J Street, Sacramento')]
      end
    end
  end

  
end