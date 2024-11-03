Pair programming: Erin, Camille, Bella
Time:  130 minutes

1. in bikes model, add attributes:
    ```ruby:
    attr_accessor :status
    def initialize(status)
        @status = status
    end
    ```

2. camille added paths in routes: 
    - for the login: 
        - useage: on url link type
        ``` 
        /users/login
        ```

    - for signup page: 
        -useage: on url linke type
        ```
        /users/signup
        ```

    - there is now a link to the registration page on the login page for users who havent signed up. 

    - the register button on registration page should be set up to take you to a page that says "yay you did it" 
        - then there will be a link back to home page
        - and a link back to login screen. 

3. in the user controller (don't know if this is where it should be but we'll check later)
    - created a login function to check the validity of the username and password 
    - created a password correct function 
        - if correct, redirect to main view of bikes and stations 
        - if incorrect render view again with flash notice (which is in the view?) 

4. have determined we need a bike controller
    - this will have one function of update status
        - 0 at station
        - 1 in use
        - (-1) broken 

        those will be added to the view that renders them on the table accordingly 

5. on map: 
    - have pins that are also buttons for all the stations. 
        - make this route: 
            ```
            /map_home
            ```
    - station list next to map
        - all station Addresses? are links to the list of bikes at that station 
            - rent bike button on that view

6. issues with attributes in the rental class being part of toher classes
    - do they need to be "declared" in the rental class if they exist as part of other classes?

7. bella is going to add all the A1 parts from johanna's stuff later tonight. 

Pair Programming: Camille and Erin
Time: 80 minutes

1. Continued working in User model to implement with log in form
    -Encountering confusing errors, decided to revisit later
2. Worked on routes, redirect to homepage instead of stations page
   - Added a PagesController, switched homepage_valetbite to index
