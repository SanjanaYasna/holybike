class PaymentsController < ApplicationController 
  def new
    @ride = Ride.find(params[:ride_id])
  end

  def create
    @ride = Ride.find(params[:ride_id])
    @payment_amt = @ride.calculate_payment 

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken]
    })

    product = Stripe::Product.create({
      name: 'Bike ride Payment',
      description: 'rents a bike',
    })

    price = Stripe::Price.create({
      product: product.id,
      unit_amount: @payment_amt,
      currency: 'usd',
    })

    session = Stripe::Checkout::Session.create(
      customer: customer.id,
      payment_method_types: ['card'],
      line_items: [{
        price: price.id,
        quantity: 1,
      }],
      mode: 'payment',
      # success url uses 'localhost:3000/...'. It works, but it'll break if we use another website name
      success_url: 'http://localhost:3000/success?session_id={CHECKOUT_SESSION_ID}', 
      cancel_url: request.referer, # request.referer = go back to the page that sent the request (the payment page)
      metadata: {ride_id: @ride.id}
    )
    # this redirects to a checkout page made by stripe
    redirect_to session.url, allow_other_host: true
  end

  def success
    session_id = params[:session_id]  # session_id for payments is separate from user_id session
    session = Stripe::Checkout::Session.retrieve(session_id) 
    
    # if the payment is successful, create a rental that stores the ride 
    # and update the current station of the bike
    if session.payment_status == 'paid' 
      @ride = Ride.find(session.metadata.ride_id)
      @rental = Rental.create(user: @ride.user, ride: @ride, cost: @ride.calculate_payment)
      @bike = Bike.find_by(identifier: @ride.bike_id)
      @bike.update!(current_station_id: @ride.end_station_id)
      flash[:notice] = "Rental Successful!"
    else
      flash[:error] = "Something went wrong with the rental."
    end
    redirect_to root_path
  end
  
end
