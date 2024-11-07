class RidesController < ApplicationController  
  def index
    if params[:reverse].blank? || params[:reverse]== "0"
      @rides = Ride.all.order(identifier: :asc)
    else
      @rides = Ride.all.order(identifer: :desc)
    end
  end

end
