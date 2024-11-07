Bella, Erin, Camille 
time: 11:00 - 2:30pm, 3.5 hr

1. how to return bike? 
    - is this based off location? 
    - is this based off the bike being at the station? 
        - how can we do this without the user input?

2. views: 
    - rental form 
    - payment form view
    - view with a timer and one big end button -> which takes you to return form?
    - return form 

3. made stations a has many association for rental

4. made payment and ride model:
    - payment model: 
        ```ruby: 
        class Payment < ApplicationRecord

            def initialize(first_name, last_name, address, credit_card_num, cvv)
                @first_name = first_name
                @last_name = last_name
                @address = address 
                @credit_card_num = credit_card_num
                @cvv = cvv
            end
            
            validates_presence_of    :identifier,
                                    :first_name,
                                    :last_name,
                                    :address,
                                    :credit_card_num,
                                    :cvv
            validates_uniqueness_of  :identifier, :credit_card_num
            
            belongs_to :User, :Rental
            
            end
        ```

    - ride model:
        ```ruby:
        class Station < ApplicationRecord
            validates_presence_of    :identifier,
                                    :user,
                                    :start_time,
                                    :end_time,
                                    :start_station,
                                    :end_station
                                    
            validates_uniqueness_of :identifier
            
            belongs_to :User
            
            end
        ```

5. rides controller: 
    ```ruby: 
    class RidesController < ApplicationController  
        def index
            if params[:reverse].blank? || params[:reverse]== "0"
            @rides = Ride.all.order(identifier: :asc)
            else
            @rides = Ride.all.order(identifer: :desc)
            end
        end

        end
    ```

6. payments controller:
    ```ruby: 
    class PaymentsController < ApplicationController
  
    end    
    ```

7. rental controller: 
    ```ruby: 
    class RentalsController < ApplicationController
  
    end    
    ```


8. for new.html.erb in views/rentals: 
    - TODO: add in form with changes above ^ + flash alerts and jazz form new.html.erb form the sessions views.
  
    - TODO: pre populated fields of: 

        - user name
        - bike number from the selction
        - station number from the selection

      we will pretend they cant change them
    
    - TODO:  FIX PATHS ON LINK TO on BOTTOM
    
    - when you submit form thats whe start time gets updated. 

    - End button appear at redirect off submit? 

    
9. i tried to show jsut each station and their specific bikes: 
    - there are commented sections in stations row view for the link to each page using a id parameter
    - there is a commented section in the routes file for get stations/:id
    - there is a commented section in the stations controller for show. 

    - TODO: need to create the show.html.erb file to show.  