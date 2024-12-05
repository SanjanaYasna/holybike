bella
245-4 (1.25 hr)

1. made unlogged in nav bar
2. made format changes for consistency 

Erin
Time: 2.5 hr
- Added Leaflet to application.html.erb, code via quickstart guide https://leafletjs.com/examples/quick-start/ 
   https://leafletjs.com/examples/quick-start/ and Medium post https://alicia-paz.medium.com/leaflet-rails-7-quick-start-guide-c372d96b3a02
1. Pinned leaflet to importmaps with the following command run in root dir:
    ./bin/importmap pin leaflet
  Also added the following line to importmaps.rb:
    pin "leaflet-css", to: "https://ga.jspm.io/npm:leaflet-css@0.1.0/dist/leaflet.css.min.js"
2. Added stylesheet and script to application.html.erb
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
     integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
     crossorigin=""/>
 <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
     integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
     crossorigin=""></script>

3. Created maps.js in assets/javascripts
4. Add map div to view placeholder.html.erb
<div id="map" style="height: 400px;"></div>
5. Added imports to application.js 
import "leaflet"
import "leaflet-providers"
import "leaflet-css"

6. Added script directly to div and source + stylesheet from step 2 in placeholder.html.erb
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
        crossorigin=""></script>

    <div id="map" class="leaflet-container" style="height: 400px;" >
      <script>var map = L.map('map').setView([42.319519, -72.629761], 13);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
      </script>
    </div>  

7. Removed the following placeholder code from placeholder.html.erb
  <!--TO DO: HOW TO HANDLE COSTS OF MAPS API + SEARCH COMPLETION API FOR GOOGLE-->
    <%# <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Enter your current location" aria-label="Enter your destination" aria-describedby="button-addon2">
        <div class="input-group-append">
        <button class="btn btn-outline-secondary" type="button" id="button-addon2" style = "background-color: beige;">Search</button>
        </div>
        <div id="canvas-for-googlemap" style="height:100%; height: 700px; width:100%;max-width:100%;">
        <iframe style="height:100%;width:100%;border:0;" frameborder="0" 
        src="https://www.google.com/maps/embed/v1/place?q=Smith+College+&key=AIzaSyBFw0Qbyq9zTFTd-tUY6dZWTgaQzuU17R8">
        </iframe></div><a class="embed-map-html" href="https://kbj9qpmy.com/bp" id="grab-maps-authorization">
          </a><style>#canvas-for-googlemap .text-marker{}.map-generator{
            max-width: 100%; max-height: 100%; background: none;</style>
    </div> %>



    <div id="map" class="leaflet-container" style="height: 400px;" >
      <script>
        var stations = <%= raw @stations.to_json %>;
        var map = L.map('map').setView([42.319519, -72.629761], 13);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
        stations.forEach(function(station) {
            L.marker([station.latitude, station.longitude])
            .addTo(map)
            .bindPopup(station.name);
        });
      </script>
    </div>  