Teetly (this is cumulative from 10/28 to end of week): 

## Merged Camille's and Bella's branches (~6 hours)

Login and signup from Camille's branch works alongside sessions authorization after some tweaking and debugging (~5 hours, including pair programming after class)

Merged Bella's code on stations and bike appearances


## Embedded map into main page placeholder:

Did prior main page design (~2 hours) but the map display didn't really work as intended 

Added following to placeholder page for proper map display. TODO map API to read from bike database objects

```html:
    <!-- Homepage content starts here!-->
  <h3 style="color:white"> Where are you headed to? </h3>
  <!--TO DO: HOW TO HANDLE COSTS OF MAPS API + SEARCH COMPLETION API FOR GOOGLE-->
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Enter your current location" aria-label="Enter your destination" aria-describedby="button-addon2">
        <div class="input-group-append">
        <button class="btn btn-outline-secondary" type="button" id="button-addon2" style = "background-color: beige;">Search</button>
        </div>
        <div id="canvas-for-googlemap" style="height:100%; height: 700px; width:100%;max-width:100%;">
        <iframe style="height:100%;width:100%;border:0;" frameborder="0" 
        src="https://www.google.com/maps/embed/v1/place?q=Smith+College+&key=AIzaSyBFw0Qbyq9zTFTd-tUY6dZWTgaQzuU17R8">
        </iframe></div><a class="embed-map-html" href="https://kbj9qpmy.com/bp" id="grab-maps-authorization">
          Broadband Providers</a><style>#canvas-for-googlemap .text-marker{}.map-generator{
            max-width: 100%; max-height: 100%; background: none;</style>
    </div>
```

## Adjusted styling to menu  navbar partial to include switch account and logout links (~1 hour)

Now using glyphicons, linked as :

``` html:
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
```

Nov 8 - Nov 14:


## Bikes and Stations are viewable in main page

~10 hours:

Bella and I had a lot of issues in getting the bikes and stations to show with proper ids (making sure station ids are station ids, bike ids are bike ids)

Pages_controller now passes stations objects as local context to the pages and the index renders partials of the bikes and stations objects

Fixed routes to allow proper instantiation of stations and bikes displays


## merged together a working main branch:

~2 hours
Combined Bella's code with my own and got a working product that has all features as intended. Wrote additional documentation and comments

## logout and session deletion code available 

~30 mins

## Series of pair programming seessions with Bella and Camille

~5 hours 
Details in dev_notes_pair_programming doc or (https://docs.google.com/document/d/1adFF3zZJ4W4LMygoFjCSBrxM6OfKec6507lkaO1QFwc/edit?usp=sharing)