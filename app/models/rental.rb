class Rental < ApplicationRecord
  has_many :bike
  # belongs_to :start_station
  # belongs_to :end_station
  belongs_to :user
end
