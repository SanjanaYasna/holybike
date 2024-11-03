class User < ApplicationRecord
  has_secure_password

  validates :fname, :lname, :email, :phone, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 14 }

  # If 'identifier' is necessary, ensure it's validated
  validates :identifier, uniqueness: true
  
  #has_many :Bike, :Ride, :Broken_report, :Review, :Rental   #foreign_key: true (must correspond across tables)
  
end
