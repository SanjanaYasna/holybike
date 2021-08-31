# ValetBike App Creation Notes
Instructions for replicating my from-scratch creation of the ValetBike app skeleton on an Apple M1 machine.

## 1. Use asdf to install latest Ruby, Rails, MySQL
- `export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"` (only for Ruby > 2.4)
- `export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"`
- `asdf install ruby 3.0.2`
- `asdf global ruby 3.0.2` (to activate it for rails install)
- `gem install rails --version 6.1.4`
- `gem install mysql2  -- --with-opt-dir="$(brew --prefix openssl@1.1)"` (opts for M1 mac)

## 2. Create app and repo
- `rails new valetbike --skip-webpack-install` (use: `rails _6.1.4_ new` if multigems installed)
- `cd valetbike`
- Add .tool-versions to app directory: `asdf local ruby 3.0.2`
- Update .gitignore
- `git init`
- `git add .`
- `git commit -m "Initial commit."`

## 3. Configure the app
- Remove unused gems (like webpack) from Gemfile
- Follow additional instructions here:   
  https://www.reddit.com/r/rails/comments/b0goct/webpacker_for_non_js_people/eih2930/
- Add mysql2 and jquery-rails to Gemfile
- Swap sqlite for mysql in /config/database.yml
- Add env file with database credentials in /config/initializers/_env.rb
- Create database in SQL
  - `mysql -u root -p`
  - `CREATE DATABASE valetbike_development;`
- Run `bundle install`
- `rackup`
- Open http://localhost:9292/ in a browser and you should see the Yay! You’re on Rails! page

## 4. Code a bit of the start
- `rails generate model station identifier:integer name:string address:string`
- `rails generate model Bike identifier:integer current_station_id:integer`
- `rake db:migrate`
- Set up validators and relations station.rb & bike.rb
- `rails generate controller stations`
- Add CSS style framework and create station list view
