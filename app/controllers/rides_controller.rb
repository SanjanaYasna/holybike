class RidesController < ApplicationController  
  def index
    if params[:reverse].blank? || params[:reverse]== "0"
      @rides = Ride.all.order(identifier: :asc)
    else
      @rides = Ride.all.order(identifer: :desc)
    end
  end
  #should render index and pass the autofil params
  def new
    # @station_address =  Station.find_by(id: params[:station_id]).address
    @ride = Ride.new
    @bike_id = params[:bike_id]
    @start_station_id = params[:station_id]
    #current user is meant to be more so r3ental info
    @current_user = User.find_by(id: session[:user_id])
    #logger.debug "current start station id: #{@start_station_id}"
    render :index
  end

  def create
    # using .build for now https://apidock.com/rails/v5.2.3/ActiveRecord/Associations/CollectionProxy/build
    # it lets you pass in current user separately
    #pass in ride params to new function, and have these params be set for ride attributes one by one
    @ride = Ride.new(ride_params)
    #issue is above iwth ride param creation...
    logger.debug "ride params: #{@ride.attributes}"
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
  def ride_params # user id not included since user is always current user
    params.inspect
    params.require(:ride).permit(:user_id, :bike_id, :start_time, :end_time)
  end
end
