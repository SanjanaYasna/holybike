class PaymentsController < ApplicationController
  def new
    @ride = Ride.find(params[:ride_id])
    @payment_amt = @ride.price
    logger.debug "Payment Amount: #{@payment_amt}"
    render :index
  end
  
  def create
    @ride = Ride.find(params[:ride_id])
    @payment_amt = @ride.price 

    customer = Stripe::Customer.create({ # Make a customer
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    })

    product = Stripe::Product.create({ # make the 'product' (the rental)
      name: 'Bike Rental Payment',
      description: 'rents a bike',
    })
     price = Stripe::Price.create({ #charge replaced iwth simple price object for product (ride) and ride price
      product: product.id,
      unit_amount: @payment_amt,
      currency: 'usd',
    })

    session = Stripe::Checkout::Session.create( 
      customer: customer, 
      payment_method_types: ['card'],
      line_items: [{
        price: price.id,  # amount needs to be Price object not just integer
        quantity: 1,
      }],
      mode: 'payment',
      success_url:  'http://localhost:3000/success?session_id={CHECKOUT_SESSION_ID}', # i don't know what these are for, but it throws an error when i get rid of this
      cancel_url: request.referer,
      metadata: {ride_id: @ride.id}
     )
     redirect_to session.url, allow_other_host: true
  end 
    def success
      session_id = params[:session_id]  # session_id for payments is separate from user_id session
      session = Stripe::Checkout::Session.retrieve(session_id) 
      
      # if the payment is successful, create a rental that stores the ride 
      # and update the current station of the bike
      if session.payment_status == 'paid' 
        @ride = Ride.find(session.metadata.ride_id)
        #that's a lot of inefficiency here
        @rental = Rental.create(email: @ride.email, bike_id: @ride.bike_id, 
        price: @ride.price,
        start_station_id: @ride.start_station_id, end_station_id: @ride.end_station_id,
        start_time: @ride.start_time, end_time: @ride.end_time)
        logger.debug "Rental: #{@rental}"
        @rental.save!
        #show bike as end station now
        @bike = Bike.find_by(identifier: @ride.bike_id)
        @bike.update!(current_station_id: @ride.end_station_id)
        flash[:notice] = "Rental Successful!"
      else
        flash[:error] = "Something went wrong with the rental."
        redirect_to render_404_path
      end
      redirect_to root_path
    end

    #TODO : deal with card error later
    # rescue Stripe::CardError => e
    #   flash[:error] = e.message
    #   #for now, make it redirct ot 404
    #   redirect_to render_404_path
end
