bella 
1015-1215 two hours

1. pass the bike.identifier and bike.current_station_address that you get get from app/views/bikes/_row.html.erb 
to the form for rentals (to rentals/index.html.erb, under views) as an autofill

for this, its not necessary to have the "pass_bike_and_station_to_for.html.erb" file. You can do this within the link_to on each row using params. 
    
 - made the link_to as follows (in app/views/bikes/_row.html.erb): 
    ```
    <%= link_to "Rent", new_rental_path(:bike_id=> bike.identifier, :station_id => bike.current_station_id, :station_address => bike.current_station.address) %>
    ```
 - add the following in the rentals controller under the new function: 
    ```
    @current_user = User.find_by(id: session[:user_id])
    @bike_id = params[:bike_id]
    @station_id = params[:station_id]
    @station_address = Station.find_by(id: params[:station_id]).address
    ```
 - then in app/views/rentals/index.html.erb:
    ```ruby: 
        <div class="field">
            <%= f.label :bike_id, "Bike ID #" %><br/>
            <%= f.text_field :bike_id, :value=> @bike_id %>
        </div>

        <div class="field">
            <%= f.label :station_id, "Station ID #" %><br/>
            <%= f.text_field :current_station_id, :value=> @station_id %>
        </div>

        <div class="field">
            <%= f.label :first_name, "first name" %><br/>
            <%= f.text_field :first_name, :value=> @current_user.fname%>
        </div>
  
        <div class="field">
            <%= f.label :last_name %><br/>
            <%= f.text_field :last_name, :value=> @current_user.lname %>
        </div>

        <div class="field">
            <%= f.label :current_station_address %><br/>
            <%= f.text_field :current_station_address, :value=> @station_address %>
        </div>
    ```