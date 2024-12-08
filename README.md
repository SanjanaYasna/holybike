# ValetBike
NAME: Bella falbo, Sanjana Yasna, Camille Mathis, Erin Riley

Smith College CSC223: Software Engineering\
ValetBike MVP

## Environment Configuration

### After cloning repo:

Add a database.yml file under config/ as follows, adjusting credientials:

``` yml
# MySQL. Versions 5.5.8 and up are supported.
#
# Install the MySQL driver
#   gem install mysql2
#
# Ensure the MySQL gem is defined in your Gemfile
#   gem "mysql2"
#
# And be sure to use new-style password hashing:
#   https://dev.mysql.com/doc/refman/5.7/en/password-hashing.html
#
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: your root
  password: your password
  socket: <%= ENV['MYSQL_SOCKET'] || '/tmp/mysql.sock' %>

development:
  <<: *default
  database: valetbike_development

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: valetbike_test

# As with config/credentials.yml, you never want to store sensitive information,
# like your database password, in your source code. If your source code is
# ever seen by anyone, they now have access to your database.
#
# Instead, provide the password or a full connection URL as an environment
# variable when you boot the app. For example:
#
#   DATABASE_URL="mysql2://myuser:mypass@localhost/somedatabase"
#
# If the connection URL is provided in the special DATABASE_URL environment
# variable, Rails will automatically merge its configuration values on top of
# the values provided in this file. Alternatively, you can specify a connection
# URL environment variable explicitly:
#
#   production:
#     url: <%= ENV["MY_APP_DATABASE_URL"] %>
#
# Read https://guides.rubyonrails.org/configuring.html#configuring-a-database
# for a full overview on how database connection configuration can be specified.
#
production:
  <<: *default
  database: valetbike_production
  username: valetbike
  password: <%= ENV["VALETBIKE_DATABASE_PASSWORD"] %>
```

### run db tasks

```shell

rake db:create

rake db:schema:load 

rake db:migrate

rake db:import_stations["notes/station-data.csv"]

rake db:import_bikes["notes/bike-data.csv"] 
```

### export stripe api keys to env

We have sent you a secrets.yml file, but this step isn't essential to the setup since the payments feature is a work in progress 
(and will remain in test mode)

``` shell
export STRIPE_PUBLISHABLE_KEY=[stripe_publishable_key]
export STRIPE_SECRET_KEY=[stripe_secret_key]
``` 

### Run server!

``` shell
rails s
```

# Model Organization for most important files:

## Controllers

### application_controller.rb:

Base of ActionController API, imports Flash (used in registrations and sessions controllers, along with html.erb files) and Cookies (session tracking in sessions controller) modules
Functions: 
authorize 
render_unprocessable_entity

### bikes_controller.rb:

Functions:
index: reverses bike order

### pages_controller.rb:

Functions:
placeholder: Renders placeholder (main) page and other templates from the pages folder of views

discounts and about functions render those respective pages. Discounts is work in progress


### payments_controller.rb

Used with stripe API to render payments page for pay for bike

Functions:
create: Stripe::Customer.create, and Stripe::Charge.create that defaults to 10000 for now


### rentals_controller.rb 

Creates rental object that takes from rental form. The rental form has autofill properties since once a user clicks on a bike to rent, 
the bike and station id properties are immediately passed to look up station and bike

Functions:
new: get current_user, bike_id, station_id, station_address (found by station_id)

### rides_controller.rb

Has ability to reverse ride options

### registrations_controller.rb 

creates User by calling User.rb for attribute validation
Functions: 
new: new user
create: creates user by passing in form inputs collected from user_params function
user_params: requires user form information for user creation

### sessions_controller.rb

authorizes user if user is logged in, otherwise, aids in session creation upon user creation 
functions:
destroy: destroy session id if user logged out 
create: authenticates user, if signed in, redirected to login page to then be redirected to home/main page (placeholder.html.erb)

### stations_controller:

Functions:
index: in order or reverse order stations displays
show: find a station by id, and show all bikes under docked_bikes attribute to station, else alert station not found message
render_stations_in_pages: passes in all stations object collection to partial to show stations (pages/_index.html.erb) and 

### users_controller.rb: 

Reads data from sessions controller and flags successful creation of user
Functions: 
create: checks if user is valid, flashes successful or unsuccessful user creation
user_params: passes in params to create
profile: assigns user to current session user for profile pages

# Views (a few of them, since there's sooo many...)

Shared folder contains partial rendering templates...

### sessions/new.html.erb 

Login form display

### registrations/new.html.erb

Sign up form display

### pages/placeholder.html.erb

Displays map and navbar partial rendering from shared/navbar

### pages/index.html.erb

Renders with placeholder to display bike rental options by station 
This is the class for passing in proper local context to different pages to be rendered

### stations/index.html.erb

Calls the _rows.html.erb partial to render rows of stations and bikes, and works with show.html.erb to list station and bike info


 ### bikes/index.html.erb and _row.html.erb

 These are used to display bikes, and the bike selected from a given row gets its information passed to the rentals path for rentals form autocomplete

 ### payments/new.html.erb

 Display of stripe's payments page. For now, a bike is by default $100 

 ### shared/...

 Contains all partials (navbar for both pre and post login, footer)

 ### users/profile.html.erb

 display upon clicking profile button of navbar, takes from user module the user name and email 