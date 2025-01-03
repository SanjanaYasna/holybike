class RentalsController < ApplicationController  
  # Ride creation, including the form, is now entirely handled by rides_controller.
  def index # Lists all rentals made by the current user
    # This could also be rides index
    # @rental.user_id = @current_user.email
      # Using a string for rental_id will need a new migration
    # logger.debug "user info:  #{@current_user}"
    @rentals = Rental.where(user_id: current_user.id)
    render :index
  end

  #   def new
  #     @current_user = User.find_by(id: session[:user_id])
  #     @bike_id = params[:bike_id]
  #     @station_id = params[:station_id]
  #     @station_address =  Station.find_by(id: params[:station_id]).address
  #     @rental = Rental.new
  #     render :index
  #   end
  
  #   def create
  #     Rails.logger.debug "Create rental called"
  #     # using .build for now https://apidock.com/rails/v5.2.3/ActiveRecord/Associations/CollectionProxy/build
  #     # it lets you pass in current user separately
  #     @rental = Rental.new(rental_params)
  #     @rental.user_id = @current_user.email
  #     logger.debug "user info:  #{@current_user}"
  #     if @rental.save
  #       redirect_to new_payment_path(rental_id: @rental.id)
  #     else
  #       flash.now[:alert] = @rental.errors.full_messages.to_sentence
  #       logger.debug "Rental Failed: rental attributes hash: #{@rental.attributes.inspect}"
  #       render :new
  #     end
  #   end
  
  #   private
  #   def current_user
  #     @current_user = User.find_by(id: session[:user_id])
  #   end
  
  #   def rental_params # user id not included since user is always current user
  #     params.require(:rental).permit(:bike_id, :start_station_id, :end_station_id, :start_time, :end_time)
  #   end
    
  
  #   #station_id would actually be the number of the csv row for that station relative to others, as opposed to the explicit station identifier that the bike references
  #   #bike_id is true to its word. It is the 4 digit unique bike identifier
    
  #   #dont think we need this.
  #   #def pass_bike_and_station_to_form
  #       #render :pass_bike_and_station_to_form 
  #   #end
  # end
end

