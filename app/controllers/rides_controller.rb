class RidesController < ApplicationController
  def index
    if params[:reverse].blank? || params[:reverse]== "0"
      @rides = Ride.all.order(identifier: :asc)
    else
      @rides = Ride.all.order(identifer: :desc)
    end
  end
  
  def new
    @current_user = User.find_by(id: session[:user_id])
    @bike_id = params[:bike_id]
    @station_id = params[:station_id]
    @station_address =  Station.find_by(id: params[:station_id]).address
    @ride = Ride.new
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
    Rails.logger.debug "Create rides called"
    # using .build for now https://apidock.com/rails/v5.2.3/ActiveRecord/Associations/CollectionProxy/build
    # it lets you pass in current user separately
    price = calculate_payment(ride_params[:start_time], ride_params[:end_time], ride_params[:discount_code])
    @ride = Ride.new(bike_id: ride_params[:bike_id], 
                    start_time: ride_params[:start_time], 
                    end_time: ride_params[:end_time], 
                    price: price, 
                    start_station_id: ride_params[:start_station_id], 
                    end_station_id: ride_params[:end_station_id])
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
    # Probably need to make new migration to get rid of start/end station
    params.require(:ride).permit(:bike_id, :start_station_id, :end_station_id, :start_time, :end_time, :discount_code)
    #params.require(:ride).permit(:user_id, :bike_id, :start_time, :end_time)
  end

  #station_id would actually be the number of the csv row for that station relative to others, as opposed to the explicit station identifier that the bike references
  #bike_id is true to its word. It is the 4 digit unique bike identifier
  #dont think we need this.
  #def pass_bike_and_station_to_form
      #render :pass_bike_and_station_to_form 
  #end
end