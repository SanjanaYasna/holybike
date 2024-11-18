class RentalsController < ApplicationController

  def new
    @current_user = User.find_by(id: session[:user_id])
    @bike_id = params[:bike_id]
    @station_id = params[:station_id]
    @station_address =  Station.find_by(id: params[:station_id]).address
    render :index
  end
  
  #station_id would actually be the number of the csv row for that station relative to others, as opposed to the explicit station identifier that the bike references
  #bike_id is true to its word. It is the 4 digit unique bike identifier
  
  #dont think we need this.
  #def pass_bike_and_station_to_form
      #render :pass_bike_and_station_to_form 
  #end
end