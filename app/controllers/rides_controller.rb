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
  def calculate_payment(start_time, end_time, discount_code)
    # Test
    # can you subtract datetime objects?
    puts "dicount code: #{discount_code}"
    #parse the string into a datetime object
    start_time = DateTime.parse(start_time).to_i
    end_time = DateTime.parse(end_time).to_i
    ride_duration = end_time - start_time
    minutes = (ride_duration / 60).to_i
    payment_amt = minutes * 100
    case discount_code
    when "LearningIsFun"
      return payment_amt * 0.6
    when "YayBeingOld!"
      return payment_amt * 0.5
    when "TheBikeGod"
      puts "TheBikeGod detected"
      return 0
    else
      return payment_amt
    end
  end

  def create
    # using .build for now https://apidock.com/rails/v5.2.3/ActiveRecord/Associations/CollectionProxy/build
    # it lets you pass in current user separately
    #pass in strong params to a temp array of params so you can add and modify params as needed
    #VERY BAD PRACTICE (not thread safe) - need to fix
    price = calculate_payment(ride_params[:start_time], ride_params[:end_time], ride_params[:discount_code])
    @ride = Ride.new(email: ride_params[:email], 
                    bike_id: ride_params[:bike_id], 
                    start_time: ride_params[:start_time], 
                    end_time: ride_params[:end_time], 
                    price: price, 
                    start_station_id: ride_params[:start_station_id], 
                    end_station_id: ride_params[:end_station_id])
    @ride.user_id = current_user.id
    #issue is above iwth ride param creation...
    logger.debug "ride params: #{@ride.attributes}"
    if @ride.save
      redirect_to new_payment_path(ride_id: @ride.id)
    else
      flash.now[:alert] = @ride.errors.full_messages.to_sentence
      logger.debug "Ride Failed: ride attributes hash: #{@ride.attributes()}"
    #   #TODO create error page
    #   #render :some_failed_ride_page
    end
  end
  
  private
  def current_user
      @current_user = User.find_by(id: session[:user_id])
  end
  def ride_params # user id not included since user is always current user
    params.inspect
    params.require(:ride).permit(:email, :bike_id, :start_time, :end_time, :price, :start_station_id, :end_station_id, :discount_code)
  end
end
