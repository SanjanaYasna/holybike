class User < ApplicationRecord
    attr_accessor :fname,:lname, :email, :phone, :pword
    def initialize(fname, lname, email, phone, pword)
        @fname = fname
        @lname = lname
        @email = email 
        @phone = phone
        @pword = pword
    end

  validates_presence_of    :identifier,
                           :fname,
                           :lname,
                           :email,
                           :phone,
                           :pword
  validates_uniqueness_of  :identifier, :email
  
  has_many :bikes, :rides, :broken_reports, :reviews, :rentals   #foreign_key: true (must correspond across tables)
end