# The Rentals-Payment-Rides Summary
## Stuff That Needs Migrations+New Gem
1. Run rails db:migrate to make the rentals and rides tables
2. Bundle install for the stripe api gem

## Rides
1. Rides belong to a user and store bike_id, :start_station_id, :end_station_id, :start_time, and :end_time
2. The rentals form (rentals/index) has changed to rides
    - Now, that form creates a 'ride' instead of a rental
    - A rental is created only after the payment is completed
3. The ride model also has calculate_payment
    - Currently, the cost == minutes
    - cost is stored as: dollars*100 for stripe's charge model


## Rentals
1. Rentals belongs_to a ride and stores: user_id, ride_id, and cost
    - It's supposed to have start+end time too
2. There's a view rentals/index.html.erb that prints out all the rentals/rides of a user
    - There's no buttons to it, but it does display when you go to '/rentals'
    - I made it to test the rentals and rides
    - This can be deleted/replaced

## Payment
1. The payments controller uses the stripe api, and I think it's working now. Except for updating the station of the bike to the end station.
    - Tutorial for session: https://learnetto.com/tutorials/how-to-accept-payments-with-stripe-in-rails-7 

#### new
The new function initializes a new payment without saving
#### create
Create finds the new ride made by new based on the id recieved from the new rides form. 
Then, it calculates the payment. (payment is an int where 1 dollar is 100)
- The customer is made with the inputed email
- the price is based off of the amount calculated by ride
- session handles the link to stripe's premade checkout
    - https://docs.stripe.com/api/checkout/sessions?lang=curl
- the success url is based off of local host, so it might break
- metadata: I couldn't figure out how to pass in the ride.id to the success path, so I used metadata instead
    - https://docs.stripe.com/api/metadata
- `redirect_to session.url, allow_other_host: true` 
    - This redirects to stripe's premade checkout page `session.url`. 
    - `allow_other_host` lets you redirect to an outside page
#### success
- This creates a rental based off the ride, if the payment is successful. 
- The bike station is updated to the end station from the ride. 
- I tried using stripe's `charge`, but it ended up causing a token error because it wanted to reuse the token after the customer was created.
- So, now this uses `session.payment_status`

```ruby
    if session.payment_status == 'paid'  # Check if the payment was successful
      @ride = Ride.find(session.metadata.ride_id)
      @rental = Rental.create(user: @ride.user, ride: @ride, cost: @ride.calculate_payment)
      @bike = Bike.find_by(identifier: @ride.bike_id)
      @bike.update!(current_station_id: @ride.end_station_id)
      flash[:notice] = "successful."
    else
      flash[:error] = "failed."
    end
```
## TODO
1. Figure out params for rides and maybe redo parts of form
2. Re-switch to using user email as the user id in rentals
    - Needs: Migration to add string column to rental
3. Maybe change cost. cost = minutes for now.

