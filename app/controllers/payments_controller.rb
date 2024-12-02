class PaymentsController < ApplicationController
  def new
    @ride = Ride.find(params[:ride_id])
    @payment_amt = @ride.calculate_payment*100 
  end
  
  def create
    @ride = Ride.find(params[:ride_id])
    @payment_amt = @ride.calculate_payment*100 
    customer = Stripe::Customer.create({ # Make a customer
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    })

    product = Stripe::Product.create({ # make the 'product' (the rental)
      name: 'Bike Rental Payment',
      description: 'rents a bike',
    })

    price = Stripe::Price.create({ # Calculate price based off rental 
      product: product.id,  
      unit_amount: @payment_amt,
      currency: 'usd',
    })

    charge = Stripe::Charge.create({ # make charge 
      :customer => customer.id,
      :amount => price.unit_amount, 
      :description => 'Rental Payment',
      :currency => 'usd'
    })

    session = Stripe::Checkout::Session.create( 
      customer: customer, 
      payment_method_types: ['card'],
      line_items: [{
        price: price.id,  # amount needs to be Price object not just integer
        quantity: 1,
      }],
      mode: 'payment',
      success_url:  'http://localhost:3000/success', # i don't know what these are for, but it throws an error when i get rid of this
      cancel_url: 'http://localhost:3000/cancel'
     )

    if charge.paid # .paid is a method of Stripe's charge: https://docs.stripe.com/api/charges/object 
      @ride = Ride.create(user: @rental.user, rental: @rental, price: @payment_amt)
      #puts "Ride Created! User #{@ride.user.id} has rental #{rental.id}"
      flash[:notice] = "Payment successful" 
      @payment_amt =
      redirect_to root_path
    else
      flash[:error] = "Payment failed."
      render :new 
    end
    #TODO : deal with card error later
    # rescue Stripe::CardError => e
    #   flash[:error] = e.message
    #   #for now, make it redirct ot 404
    #   redirect_to render_404_path
  end
end