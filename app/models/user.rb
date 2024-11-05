class User < ApplicationRecord

  #If using bycrypt                
  include ActiveModel::SecurePassword
  has_secure_password
  attr_accessor :password_digest

  validates_uniqueness_of :email, :phone
  #validate email format
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  # #validate phone format
  # validates :phone, format: { with: /\A\d{3}-\d{3}-\d{4}\z/, message: "only allows valid phone numbers, format 111-111-1111" }
  validates :password, presence: true

  has_many :Bike
  has_many :Ride 
  has_many :Broken_report
  has_many :Review
  has_many :Rental   #foreign_key: true (must correspond across tables)
 
  #TO DO: authenticate method (attempted below)
  # def authenticate(pword)
  #   pass
  # end
end