# ValetBike
NAME: Bella falbo, Sanjana Yasna, Camille Mathis, Erin Riley

Smith College CSC223: Software Engineering\
Starter App for ValetBike project

## Environment Configuration

As you configure your environment you should **keep a log** where you **write down all the steps you take** including **each command you type**. You will inevitably run into errors setting up your development environment and maintaining a meticulous log will allow others to help you troubleshoot. Ignore this recommendation at your own peril, but don't say you haven't been warned :]

Installing Ruby on Rails is not a trivial process. It is the essential first step to developing ValetBike, and it will take you far longer than all the other steps to complete. Be sure to set aside ample time to work through the setup.

### 0. Remember that versions matter
ValetBike runs on Ruby 3.1.2 and Rails 7.0.3.1. It is essential that you configure your environment to use these precise versions of the language and framework.

### 1. Install Ruby on Rails with MySQL

On Mac it is strongly recommended that you use asdf to install Ruby. On Windows you should set up your environment through the Windows Subsystem for Linux (WSL). The guides below explain how to do so in detail:

- [Mac Ruby on Rails Developer Environment Setup](https://github.com/deadroxy/valetbike/blob/master/notes/mac-setup.md)
- [Windows Ruby on Rails Developer Environment Setup](https://github.com/deadroxy/valetbike/blob/master/notes/windows-setup.md)

Be sure to complete all the installation procedures in the relevant guide before continuing on to the next step.

### 2. Fork & clone the ValetBike repo

- Click fork in the upper right hand corner of the ValetBike GitHub page
- This creates a copy of the repository on your personal GitHub account
- To access this code on your development machine, create a local copy of your fork with:\
  `git clone https://github.com/<your_username>/valetbike.git`
- Note: you should run that command when you are in the folder where you want to store the repo\
  (e.g. `/Users/<your_username>/Development`)

### 3. Prepare the application

- Enter the directory you just created: `cd valetbike`
- Add `.tool-versions` to app directory to ensure the right ruby is always used: `asdf local ruby 3.1.2`
- Install required gems with: `bundle install`

### 4. Configure the database environment variables

- Add a file called `.env` to the valetbike root directory
- Ensure that it includes the credentials you setup when installing MySQL:

```shell
MYSQL_USERNAME=root
MYSQL_PASSWORD=YOURPASSWORD
MYSQL_SOCKET=/tmp/mysql.sock              # For Mac
MYSQL_SOCKET=/var/run/mysqld/mysqld.sock  # For Windows
```

### 5. Prepare the database in MySQL

- Use rails to create both the development and test databases with:\
  `rake db:create`
- Or use mysql to just create the development databse with:\
  `mysql -u root -p`\
  `CREATE DATABASE valetbike_development;`\
  `exit`
- Then run the database migrations with:\
  `rake db:migrate`

### 6. Confirm that the app runs

* Launch the web server using `rackup` or `rails s` (short for `rails server`) or `bin/dev`
* If using `rackup` open http://localhost:9292 (or http://127.0.0.1:9292) in a browser
* If using `rails s` or `bin/dev` open http://localhost:3000 (or http://127.0.0.1:3000) in a browser
* You should see ValetBike welcome page
  
# File Organization

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

Renders placeholder(main) page and other templates (TODO) from teh pages folder of views

### registrations_controller.rb 

creates User by calling User.rb for attribute validation
Functions: 
new: new user
create: creates user by passing in form inputs collected from user_params function
user_params: requires user form information for user creation

### sessions_controller.rb

authorizes user if user is logged in, otherwise, aids in session creation upon user creation 
functions:
destroy: destroy session id if user logged out (TO BE CALLED, but option in navbar)
create: authenticates user, if signed in, redirected to login page to then be redirected to home/main page (placeholder.html.erb)

### stations_controller:

Functions:
index: in order or reverse order stations displays

### users_controller.rb: 

Reads data from sessions controller and flags successful creation of user
Functions: 
create: checks if user is valid, flashes successful or unsuccessful user creation
user_params: passes in params to create

## Views

Shared folder contains partial rendering templates...

### users/login.html.erb:

Login form display

### users/signup.html.erb:

Sign up form display

### pages/placeholder.html.erb

Displays map and navbar partial rendering from shared/navbar

### pages/index.html.erb

Renders with placeholder to display bike rental options by station 
This is the class for passing in proper local context to different pages to be rendered
