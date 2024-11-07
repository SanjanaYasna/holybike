Bella, Erin, Camille 
time: 11:00 - 

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
 