class User < ApplicationRecord
  #   attr_accessor :fname,:lname, :email, :phone, :pword
  #   def initialize(fname, lname, email, phone, pword)
  #       @fname = fname
  #       @lname = lname
  #       @email = email 
  #       @phone = phone
  #       @pword = pword
  #   end

  # validates_presence_of    :fname,
  #                          :lname,
  #                          :email,
  #                          :phone,
  #                          :pword
  validates_uniqueness_of :email, :phone
  has_many :Bike
  has_many :Ride 
  has_many :Broken_report
  has_many :Review
  has_many :Rental   #foreign_key: true (must correspond across tables)
 
end