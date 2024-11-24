class RentalsController < ApplicationController  
  def index # list all rentals for the current user?
    # This could also be rides index
    @rentals = Rental.where(user_id: current_user.id)
    render :index
  end
end
# Ride creation is now entirely handled by rides_controller.
