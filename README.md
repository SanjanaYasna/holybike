# ValetBike

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
  

## Assignment #1: Hello Stack, Welcome to ValetBike!

### Brief Background
You and several other junior engineers have just started at ValetBike, a community tech co-op based in Nipmuc Notch, and you are excited to finally be getting paid to contribute to a meaningful app. During your hiring interview, you said you were comfortable doing full stack programming, but stressed you hadn't worked in Ruby on Rails before. The lead developer thought you were right for the position and promised you a guided tour of the codebase on your first day. However, after your onboarding, you learn they've just gone on leave indefinitely. It also turns out the lead developer was the *only* developer at ValetBike, and now the rest of the team is counting on you and the other new programmers to complete the prototype before the scheduled launch day.

As a fearless software engineer you agree to onboard yourself and attempt to continue the build. You didn't get much information about the architecture or design of the product during your interview. All you remember is that the lead developer had been working with the [ValleyBike](https://valleybike.org) team to iterate on their system which launched in 2018 and that they were using GitHub to collaborate on their codebase.

### Assignment Goal
Your primary objective is to get your development environment configured so that the existing app will run on your machine. To exceed expectations, you must add at least one feature to the current code. To distinguish yourself, you should add two or more features. See submission guidelines below for complete details.

### How to Begin
* Create a GitHub account if you don't have one
* Go to [https://github.com/deadroxy/valetbike](https://github.com/deadroxy/valetbike)
* Follow the README instructions to configure your environment

### Teamwork Guidelines
You may work in teams of up to five people to get your environments set up and to modify the code. But you must each submit your own unique environment screenshots via Moodle. If you choose to fork the repo to add features, you can collaborate on the code, but you must each create and submit a record of a unique pull request.

### Ruby on Rails Guides
You will probably be unfamiliar with the main components of the ValetBike stack like the language (Ruby), the framework (Rails), and the database (MySQL). Luckily the lead developer left links to their favorite books and tutorials for you below. Consult them regularly as you get your bearings in the new environment.

* [Getting Started with Rails](https://guides.rubyonrails.org/getting_started.html)
* [I Love Ruby](https://i-love-ruby.gitlab.io/)
* [The Bastards Book of Ruby](http://ruby.bastardsbook.com/)
* [Why's (Poignant) Guide to Ruby](https://poignant.guide/)

### Exploration Tips
* Review the files the lead developer left in the `notes/` folder
* Pay special attention to the environment setup and [app creation](https://github.com/deadroxy/valetbike/blob/master/notes/app-creation.md) guides
* Use GitHub to dive into previous commits to see what they built so far
* Use `rails console` to experiment with creating & associating records (objects) from the command line
  - `s = Station.new(name: "Neu Station", address: "123 Novel Lane", identifier: "45")`
  - `s.save`
  - `b = Bike.new(identifier: "1234")`
  - `b.current_station = s`
  - `b.save`
  - `s = Station.new(name: "Ye Olde Statione", address: "101 Historic Way", identifier: "99")`
  - `s.save`
  - `b = Bike.new(identifier: "5678")`
  - `b.save`
  - `s`
  - `Station.last`
  - `Station.first`
  - `s = Station.first`
  - `s`
  - `s.id`
  - `s.identifier`
  - `s.docked_bikes`
  - `s.docked_bikes.count`
  - `Station.last.docked_bikes.count`
  - `Bike.first.current_station`
  - `Bike.last.current_station`
  - `Bike.find_by(identifier: "1234").update(current_station: Station.last)`
  - `Station.last.docked_bikes`
  - `Station.first.docked_bikes`

### Submission Guidelines to Meet Expectations
1. Get ValetBike running on your development machine
2. Modify the welcome message
3. Take a screenshot showing your change works (include browser, console, date/time)
4. Name the screenshot "youremail-a1-ss.png" or *.jpg (for me it would be "jbrewer-a1-ss.png")
5. Create a text file called "youremail-a1-team.txt" (for me it would be "jbrewer-a1-team.txt")
6. List the names of everyone you worked with on this assignment, including your own (for me it would be "Johanna Brewer")
7. Submit your screenshot and team list via Moodle

### Submission Guidelines to Exceed Expectations or Distinguish yourself
1. Complete all of the Meets Expectations tasks
2. Implement one (Exceeds) or more (Distinguished) of the features below
   - Show number of docked bikes at each station
   - Create rake task to import station & bike data from csv files
   - Allow user to view list of bikes
   - Allow user to switch between station and bike list views
   - Allow user to reverse sort order of stations or bikes in list view
3. Commit and push your changes to your fork on GitHub
4. Create a pull request from your modified fork to the main ValetBike repo
5. Create a file called "youremail-a1-pr.txt" (for me it would be "jbrewer-a1-pr.txt")
6. Include a complete link to your pull request as the first line of this file (e.g. "https://github.com/deadroxy/valetbike/pull/1234")
7. Submit your pull request file along with your screenshot and team list via Moodle

## License
Copyright 2021-2022, Johanna Brewer

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU Affero General Public License along with this program. If not, see https://www.gnu.org/licenses.

