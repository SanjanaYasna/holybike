class PaymentsController < ApplicationController
  def new
    @rental = Rental.find(params[:rental_id])
    @payment_amt = @rental.calculate_payment*100 
  end
  
  def create
    @rental = Rental.find(params[:rental_id])
    @payment_amt = @rental.calculate_payment*100 
    customer = Stripe::Customer.create({
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    })
    
    
    charge = Stripe::Charge.create({
      :customer => customer.id,
      :amount => payment_amt, #testing custom payment
      :description => 'Description of your product',
      :currency => 'usd'
    })

    if charge.paid # .paid is a method of Stripe's charge: https://docs.stripe.com/api/charges/object 
      @ride = Ride.create(user: @rental.user, rental: @rental)
      flash[:notice] = "Payment successful"
      redirect_to rental_path(@ride)
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