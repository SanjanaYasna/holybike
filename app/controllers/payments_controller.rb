class PaymentsController < ApplicationController
  def new
  end
  
  def create
    customer = Stripe::Customer.create({
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    })
    
    charge = Stripe::Charge.create({
      :customer => customer.id,
      :amount => 10000, #100 dollars per bike for now
      :description => 'Description of your product',
      :currency => 'usd'
    })
  
    #TODO : deal with card error later
    # rescue Stripe::CardError => e
    #   flash[:error] = e.message
    #   #for now, make it redirct ot 404
    #   redirect_to render_404_path
  end
end