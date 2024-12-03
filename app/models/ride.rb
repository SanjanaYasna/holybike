class Ride < ApplicationRecord
  has_one :bike
  # belongs_to :start_station
  # belongs_to :end_station
  belongs_to :user

  def calculate_payment(start_time, end_time)
    # Test
    # can you subtract datetime objects?
    #parse the string into a datetime object
    start_time = DateTime.parse(start_time).to_i
    end_time = DateTime.parse(end_time).to_i
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
