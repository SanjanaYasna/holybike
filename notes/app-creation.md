## ValetBike App Creation Notes
Below is a step by step explanation walkthrough of how the existing ValetBike app was created from scratch on an Apple M1 machine. The machine which was used for this process already had a fully configured Ruby on Rails development environment. New developers hoping to replicate the steps below should first follow one of the other guides included in this folder:

* [Mac Ruby on Rails Developer Environment Setup](https://github.com/deadroxy/valetbike/blob/master/notes/mac-setup.md)
* [Windows Ruby on Rails Developer Environment Setup](https://github.com/deadroxy/valetbike/blob/master/notes/windows-setup.md)

### First update the system to use the latest versions of Ruby and Rails

- Update asdf with the latest language packs:\
  `asdf update`\
  `asdf plugin update ruby`
- Install the newest ruby and set it as default on system:\
  `export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"`\
  `asdf install ruby 3.1.2`\
  `asdf global ruby 3.1.2`
- Install the latest Rails, MySQL and Bundler gems:\
  `gem install rails --version 7.0.3.1`\
  `gem install mysql2  -- --with-opt-dir="$(brew --prefix openssl@1.1)"`\
  `gem update bundler`

### Next create a new application and configure the repository

- Create the app with: `rails new valetbike --css tailwind --database=mysql`
- Note if multiple versions of Rails are installed, specify with: `rails _7.0.3.1_ new ...`
- Enter the new app directory: `cd valetbike`
- Add .tool-versions to app directory to ensure the right ruby is always used: `asdf local ruby 3.1.2`
- Update .gitignore to exclude a few additional hidden files
- Initialize the repo with:\
  `git init`\
  `git add .`\
  `git commit -m "Initial commit."`

### Then configure the database for the new application

- Update `Gemfile` to use dotenv-rails for secret credentials
- Add `.env` file with database root username, password, and socket
- Update `database.yml` to load credentials from the environment
- Run `bundle install` to update gems
- Run `rake db:create` to create the database
- Run `rackup` to start the server
- Open http://localhost:9292 in a browser to confirm the app is working

### Finally begin coding the app

- Generate the basic Station and Bike models with:\
  `rails generate model station identifier:integer name:string address:string`\
  `rails generate model Bike identifier:integer current_station_id:integer`
- Apply the changes to the database: `rake db:migrate`
- Set up validators and relations in the models `station.rb` & `bike.rb`
- Generate a controller scaffold for the stations with:\
  `rails generate controller stations`
- Update `stations_controller.rb` with an index method to load data
- Update `routes.rb` to direct the application to the new controller method
- Build and style the `application.html.erb` layout, `stations/_row.html.erb` view, and `stations/index.html.erb` view using several stylesheets `flexbox.css`, `global.css`, `pages.css`, and `variables.css`

## Parting thoughts for other developers...

Regrettably I did not have time to write a rake task to import the station and bike data the ValleyBike devs shared with us. Glancing at those CSV files, I suspect there's a bunch of useless columns in there so we should dive deeper before trying to use those as seed data for our app!