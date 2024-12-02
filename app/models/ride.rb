class Ride < ApplicationRecord
  has_many :bike
  # belongs_to :start_station
  # belongs_to :end_station
  belongs_to :user

  def calculate_payment
    # Test
    # can you subtract datetime objects?
    puts "Start: #{start_time}"
    puts "End: #{end_time}"
    ride_duration = end_time - start_time
    puts "Ride seconds: #{ride_duration}"
    minutes = (ride_duration / 60).to_i
    puts "Duration in minutes: #{minutes}"
    payment_amt = minutes * 100
    puts "Payment dollars: #{payment_amt}"
    payment_amt
  end
end
