working? Bella 
time? 21:00 - 


1. created bikes_controller.rb
    - added:
        ```ruby:
        class BikesController < ApplicationController
            def index
                if params[:reverse].blank? || params[:reverse]== "0"
                    @bikes = Bike.all.order(identifier: :asc)
                else
                     @bikes = Bike.all.order(identifer: :desc)
                end
            end
        end
        ```
 

2. in routes file: 
    - added: 
    ```ruby:
    resources :bikes,     only: [:index]
    resources :stations,  only: [:index]
    ```

3. im going to add the same index thing to the stations controller so you can view the stations in reverse! 
    - so I removeed the index method ```@stations = Station.all.order(identifier: :asc)```
        - replaced with: 
        ```ruby:
        def index
            if params[:reverse].blank? || params[:reverse]== "0"
                @stations = Station.all.order(identifier: :asc)
            else
                @stations = Station.all.order(identifer: :desc)
            end
        end
        ```

4. Created a bikes folder in views:
    1. new! _row.html.erb :
        ```ruby:
        <div class="record-row <%= cycle "odd", "even", name: "row-cycler" %> flexbox horizontal justify-space-between">
            <div><%= bike.identifier%></div>
            <div><%= bike.current_station.blank? ? "In Use" : "Docked (#{bike.current_station.address})" %></div>
        </div>
        ```

    2. new! index.html.erb :
        ```ruby:
        <div class="page-section flexbox vertical stretch">
            <div class="section-inner flexbox vertical stretch">
                <div class="section-title flexbox horizontal center">
                    Meet the HolyBike Fleet!
                    <a class="toggle" href="<%= stations_path %>">View Stations</a>
                </div>
                <div class="flexbox vertical stretch">
                    <% if @bikes.present? %>
                        <div class="record-row header flexbox horizontal justify-space-between">
                            <% if params[:reverse].blank? || params[:reverse] == "0" %>
                                <a href="<%= bikes_path(params: (reverse:1))%>">Sort &#8595;</a>
                            <% else %>
                                <a href="<%= bikes_path %>">Sort &#8593;</a>
                            <% end %>
                        </div>
                        <%= render(partial: "bikes/row", collection: @bikes, as: :bike) %>
                    <% else %>
                    <div class="empty">
                        No bikes found.
                    </div>
                    <% end %>
                </div>
            </div>
        </div>
        ```

5. stations views changes (index.html.erb) (im not sure if the 3rd edition will work!!!!): 
    1. line 3: ```<div class="section-title flexbox horizontal center">```
    2. added below line 3: 
        ```ruby: 
         Look at all these stations! 
        <a class="toggle" href="<%= bikes_path %>">View Bikes</a>
        ```
    3. added lines 9-16:
        ```ruby:
        <div class="record-row header flexbox horizontal justify-space-between">
          <% if params[:reverse].blank? || params[:reverse] == "0" %>
            <a href="<%= stations_path(params: (reverse:1))%>">Sort &#8595;</a>
          <% else %>
            <a href="<%= stations_path %>">Sort &#8593;</a>
          <% end %>
        </div>
        <%= render(partial: "stations/row", collection: @stations, as: :station) %>
        <% else %>
        ```
