class Station < ApplicationRecord
  validates_presence_of    :identifier,
                           :user,
                           :start_time,
                           :end_time,
                           :start_station,
                           :end_station
                           
  validates_uniqueness_of :identifier
  
  belongs_to :User
  
end
