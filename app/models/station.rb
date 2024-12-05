class Station < ApplicationRecord
  #Tell Geocoder to generate lat/long coords from address
  geocoded_by :address
  after_validation :geocode
  validates_presence_of    :identifier,
                           :name,
                           :address
  validates_uniqueness_of  :identifier
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id
end
