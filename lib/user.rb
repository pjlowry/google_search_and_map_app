class User
  include ActiveModel::Validations 
  attr_accessor :location

  validates :location, :presence => :true
end