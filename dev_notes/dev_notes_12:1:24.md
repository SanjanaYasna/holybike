Erin
Task: Updating backend to support adding station markers to the Leaflet map
Time: 2 hours

1. Added Geocoder to the Gemfile 

    gem 'geocoder'

2. Added following lines to station model according to Geocoder documentation https://github.com/alexreisner/geocoder 
https://anadea-info.medium.com/

geocoded_by :address
after_validation :geocode

3. Ran the following migration to give the stations latitude and longitude columns

    rails generate migration AddLocationToStations latitude:float longitude:float
    rails db:migrate

4. Geocode existing stations 
    rake geocode:all CLASS=Station

5. Updated invalid addresses to geocode-friendly values

27 Pulaski Park XX
274 Main Street Northampton MA 
42.317358   -72.633595

28 Northampton Train Station XX
170 Pleasant St, Northampton, MA 01060
42.318378   -72.627968

22 YMCA/Childs Park XX
71 N Elm St, Northampton, MA 01060
42.326871   -72.650058

21 Florence Bank Station XX
19 Meadow Street Florence MA
42.335499   -72.673988
 
29 "State Street/Mass Central Rail Trail XX
62 Chestnut St, Florence, MA 01062
42.335499   -72.673988

20 Village Hill XX
Village Hill Rd Northampton, MA 01060
42.312881   -72.647531

26 JMG XX
1 Chapin Way Northampton MA
42.335499   -72.673988


6. Run geocoder again on updated stations, check that all stations have valid lat/long values

