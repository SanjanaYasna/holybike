1. set up the import_bikes.rake based of johanna's code from class
2. set up the import_stations.rake based of johanna's code from class
3. modified _row.html.erb for docked bike count
4. created User class: 
    - added: 
        ```ruby: 
        attr_accessor :fname,:lname, :email, :phone, :pword
        ```

        ```ruby:
            def initialize(fname, lname, email, phone, pword)
            @fname = fname
            @lname = lname
            @email = email 
            @phone = phone
            @pword = pword
            end
        ```

        ```ruby:
            validates_presence_of    :identifier,
                           :fname,
                           :lname,
                           :email,
                           :phone,
                           :pword
            validates_uniqueness_of  :identifier, :email
  
            has_many :Bike, :Ride, :Broken_report, :Review, :Rental   #foreign_key: true (must correspond across tables)

        end
        ```
  
5. we could have an account class that has many users for multiple sign ins. see this [link](https://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html)

6. I think we need to make a route page for a user profile page? so there is a way to navigate to the user? [rails guide](https://guides.rubyonrails.org/getting_started.html#adding-a-second-model-generating-a-model)

    - go to config/routes.rb

        - ```ruby:
            Rails.application.routes.draw do
                root ""

                resources :mainpg? do #whatever the basis is supposed to be
                    resources :user ? 
                end
            end
            ```