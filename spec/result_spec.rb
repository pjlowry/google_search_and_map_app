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

    it 'shows address' do
      result = Result.new(:name => "Hacker Lab", :address => '1715 I Street, Sacramento, CA')
      result.address.should eq '1715 I Street, Sacramento, CA'
    end
  end

  context '#==' do  
    it 'two result objects are equal if there readers are the same' do  
      result1 = Result.new(:name => "Hacker Lab", :address => '1715 I Street, Sacramento, CA')
      result2 = Result.new(:name => "Hacker Lab", :address => '1715 I Street, Sacramento, CA')
      result1.should eq result2
    end
  end
end  