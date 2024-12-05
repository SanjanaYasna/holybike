Erin
Task: update Leaflet map with station markers
Time:

1. Update index in StationsController to pass lat/long to the view

2. Use JSON to make station data available in Javascript block https://dev.to/caicindy87/rendering-json-in-a-rails-api-25fd
https://dev.to/maylenepoulsen/basic-fetch-requests-with-js-rails-1a40


2. Add station markers to map using lat/long values

 render json: @stations.to_json(only: [:id, :name, :latitude, :longitude])

Original:
    <div id="map" class="leaflet-container" style="height: 400px;" >
      <script>var map = L.map('map').setView([42.319519, -72.629761], 13);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
      </script>
    </div>  

Updated:
https://developer.mozilla.org/en-US/docs/Web/API/Request
<%= link_to "#{station.docked_bikes.count} bikes", station%> 

  <div id="map" class="leaflet-container" style="height: 400px;">
    <script>
    document.addEventListener("DOMContentLoaded", function() {
      fetch('/stations') 
        .then(response => response.json())  
        .then(stations => {
            console.log(stations);  
            var map = L.map('map').setView([42.319519, -72.629761], 13);  // Default center
            L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
            }).addTo(map);
            // Create markers for each station
            stations.forEach(function(station) {
            L.marker([station.latitude, station.longitude])
                .addTo(map)
                .bindPopup("<b>" + station.name + "</b><br>Station ID: " + station.id);
            });
        })
      });
      </script>
  </div>