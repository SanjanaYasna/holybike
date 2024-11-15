class RentalsController < ApplicationController

  def new
    render :index
  end
  
  #station_id would actually be the number of the csv row for that station relative to others, as opposed to the explicit station identifier that the bike references
  #bike_id is true to its word. It is the 4 digit unique bike identifier
  def pass_bike_and_station_to_form
      render :pass_bike_and_station_to_form 
  end
end