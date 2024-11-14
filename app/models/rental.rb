class Rental < ApplicationRecord
  attr_accessor :start_time, 
  def initialize(start_time)
      @start_time = Time.current
  end
#do we need to add all the other info things like bike id/ station start etc etc 
#if they exist within other classes? 
#i think we just need the getter to get the other info from the other class? 

has_many :Bike, :Station
belongs_to :User, :Ride

end