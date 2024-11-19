class RidesController < ApplicationController  
  def index
    if params[:reverse].blank? || params[:reverse]== "0"
      @rides = Ride.all.order(identifier: :asc)
    else
      @rides = Ride.all.order(identifer: :desc)
    end
  end
  #should render index
  def new
    # @current_user = User.find_by(id: session[:user_id])
    # @bike_id = params[:bike_id]
    # @station_id = params[:station_id]
    # @station_address =  Station.find_by(id: params[:station_id]).address
    # @ride = Ride.new
    @bike_id = params[:bike_id]
    @start_station_id = params[:start_station_id]
    #current user is meant to be more so r3ental info
    @current_user = User.find_by(id: session[:user_id])
    render :index
  end

  def create
    Rails.logger.debug "Create ride called"
    # using .build for now https://apidock.com/rails/v5.2.3/ActiveRecord/Associations/CollectionProxy/build
    # it lets you pass in current user separately
    logger.debug "right before ride creation"
    @ride = Ride.new(ride_params)
    @ride.user_id = current_user.id
    logger.debug "after ride creation: #{ride.user_id}"
    if @ride.save
      redirect_to new_payment_path(ride_id: @ride.id)
    else
      flash.now[:alert] = @ride.errors.full_messages.to_sentence
      logger.debug "Ride Failed: ride attributes hash: #{@ride.attributes.inspect}"
      render :new
    end
  end

  private
  def ride_params # user id not included since user is always current user
    params.require(:ride).permit(:bike_id, :start_station_id, :end_station_id, :start_time, :end_time)
  end
  


end
