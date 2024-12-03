class RidesController < ApplicationController  
  cattr_accessor :price 
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
    render :index
  end
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
  def create
    # using .build for now https://apidock.com/rails/v5.2.3/ActiveRecord/Associations/CollectionProxy/build
    # it lets you pass in current user separately
    #pass in strong params to a temp array of params so you can add and modify params as needed
    #VERY BAD PRACTICE (not thread safe) - need to fix
    final_params = ride_params
    final_params[:price] = calculate_payment(ride_params[:start_time], ride_params[:end_time])
    @ride = Ride.new(final_params)
    #issue is above iwth ride param creation...
    logger.debug "ride params: #{@ride.attributes}"
    @ride.save
    # if @ride.save
    #   redirect_to root_path #new_payment_path(ride_id: @ride.user_id)
    # else
    #   flash.now[:alert] = @ride.errors.full_messages.to_sentence
    #   logger.debug "Ride Failed: ride attributes hash: #{@ride.attributes()}"
    #   #TODO create error page
    #   #render :some_failed_ride_page
    # end
  end

  private
  def ride_params # user id not included since user is always current user
    params.inspect
    params.require(:ride).permit(:user_id, :bike_id, :start_time, :end_time, :price)
  end
end
