Camille 

1. Deleted unused_pages, users/login, and users/signup
- I deleted the unused_pages folder and removed users/login.html.erb and /signup.html.erb
- Bella fixed the deleted user folders issue

2. Authorize now redirects to login if user not logged in
- Whenever I rails s after creating the database, I always get the "not authorized" message
- For, now I added this to application_controller.rb, it doesn't update the status like the render does 
```ruby: 
unless @current_user
        flash[:error] = "Please login before accessing that page"
        redirect_to new_session_path
end 
```
 
3. Stopped requiring user be logged in for registration
- Registration accidentally needed authorization so I added ```skip_before_action :authorize, only: [:new, :create]``` to the registrations controller

4. Commented out the users/signup and login paths in routes.rb 
5. Updated "VB LOGIN" button in registrations/new to point to the login page
6. The rental/new page now shows after the `rent` button is clicked in one of the station's bikes list.
- ```<%= form_with(model: @rental, url: new_rental_path, local: true, data: { turbo: false }) do |f| %>``` is the new beginning of the form
7. Trying out a drop down menu for the stations
- If this doesn't work with autofilling switch back to the earlier code
- Drop down code: 
```ruby: 
      <div class='field'>
        <%= f.label :start_station%> <br/>
        <%= f.collection_select :start_station, Station.all, :id, :name, prompt: 'Select Start Station' %>
      </div>
```
- Original code: 
```ruby:
        <div class='field'>
                <%= f.label :start_station %> <br/>
                <%= f.text_field :start_station, autofocus: true, autocomplete: 'start station' %>
        </div>

        <div class='field'>
                <%= f.label :end_station %> <br/>
                <%= f.text_field :end_station, autofocus: true, autocomplete: 'end station' %>
        </div>
```
