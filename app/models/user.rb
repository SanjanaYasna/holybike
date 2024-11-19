class User < ApplicationRecord
  has_secure_password
  validates :fname, :lname, :email, :phone, presence: true
  validates_uniqueness_of :email, :phone
  #email regex
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8, maximum: 14 }
  validates :phone, length: { is: 10 }

  # If 'identifier' is necessary, ensure it's validated
  validates :id, uniqueness: true

  has_many :Bike
  has_many :Ride 
  has_many :Broken_report
  has_many :Review
  has_many :Rental   #foreign_key: true (must correspond across tables)
  
end
