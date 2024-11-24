class RidesController < ApplicationController

  def new
    @current_user = User.find_by(id: session[:user_id])
    @bike_id = params[:bike_id]
    @station_id = params[:station_id]
    @station_address =  Station.find_by(id: params[:station_id]).address
    @ride = Ride.new
    render :index
  end

  def create
    Rails.logger.debug "Create rides called"
    # using .build for now https://apidock.com/rails/v5.2.3/ActiveRecord/Associations/CollectionProxy/build
    # it lets you pass in current user separately
    @ride = Ride.new(ride_params)
    @ride.user_id = current_user.id
    if @ride.save
      redirect_to new_payment_path(ride_id: @ride.id)
    else
      flash.now[:alert] = @ride.errors.full_messages.to_sentence
      logger.debug "Ride Failed: ride attributes hash: #{@ride.attributes()}"
      #TODO create error page
      #render :new
    end
  end

  private
  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def ride_params # user id not included since user is always current user
    params.inspect
    params.require(:ride).permit(:user_id, :bike_id, :start_time, :end_time)
  end

  #station_id would actually be the number of the csv row for that station relative to others, as opposed to the explicit station identifier that the bike references
  #bike_id is true to its word. It is the 4 digit unique bike identifier
  #dont think we need this.
  #def pass_bike_and_station_to_form
      #render :pass_bike_and_station_to_form 
  #end
end
