class Ride < ApplicationRecord
  has_many :bike
  belongs_to :user

  # Currently payment is 2*minutes
  def calculate_payment
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
