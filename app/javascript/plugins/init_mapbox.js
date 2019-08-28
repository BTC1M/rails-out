import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.features.forEach(marker => bounds.extend([ marker.geometry.coordinates[0], marker.geometry.coordinates[1] ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  var filterGroup = document.getElementById('filter-group');


  // Only build a map if there's a div#map to inject into
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      // style: 'mapbox://styles/mapbox/dark-v10'
      style: 'mapbox://styles/remiwagon/cjzjn3hsn50nz1cpgqkuhwfn7'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    const markersGeoJson = JSON.parse(mapElement.dataset.markersgeojson);

    // console.log(markers);
    // console.log(markersGeoJson);

// ----------------------------------------------------

    var inputArray = [];
    var labelArray = [];

    map.on('load', function() {
      // Add a GeoJSON source containing place coordinates and information.
      map.addSource("places", {
        "type": "geojson",
        "data": markersGeoJson
      });

      markersGeoJson.features.forEach(function(marker) {
        var symbol = marker.properties.icon['icone'];
        var category = marker.properties['category'];
        var layerID = category;

        // var el = document.createElement('div');
        // el.className = 'my-icon';

        // new mapboxgl.Marker(el)
        //   .setLngLat([ marker.geometry.coordinates[0], marker.geometry.coordinates[1] ])
        //   .addTo(map);

        // Add a layer for this marker
        if (!map.getLayer(layerID)) {
          map.addLayer({
            "id": layerID,
            "type": "circle",
            "source": "places",
            "paint": {
              'circle-radius': 8,
              'circle-opacity': 0.8,
              'circle-stroke-width': 1,
              /*'circle-stroke-color': 'white',*/
              /*'circle-stroke-opacity': 1,*/
              'circle-color': [
                'match',
                ['get', 'category'],
                'Festival', '#00FFF3',
                'Rooftop', 'blue',
                'Open air', '#FF69B4',
                'Pool Party', 'orange',
                'Club', '#088C00',
                'Beach', 'yellow',
                'Bar', 'red',
                'Concert', 'purple',
                /* other */ 'yellow'
              ]
            },
            "filter": ["==", "category", category]
          });

          // Add checkbox and label elements for the layer.
          var input = document.createElement('input');
          input.type = 'checkbox';
          input.id = layerID;
          input.checked = true;

          var label = document.createElement('label');
          label.setAttribute('for', layerID);
          label.textContent = category;
          label.style.backgroundColor = 'black';
          label.style.fontSize = '12px';
          label.style.border = '2px solid white';
          label.style.top = '35px';
          label.style.marginTop = '6px';
          label.style.marginRight = '15px';
          label.style.borderRadius = '4px';
          label.style.boxShadow = '3px 3px 0px white';

          inputArray.push(input);
          labelArray.push(label);

          // When the checkbox changes, update the visibility of the layer.
          input.addEventListener('change', function(e) {
            map.setLayoutProperty(layerID, 'visibility',
              e.target.checked ? 'visible' : 'none');
          });
        }
      });

      // Pour afficher les checkbox lorsqu'on clique sur Filtrer
      var menuVisible = false;
      document.getElementById("btn-filter-map-id").addEventListener("click", function(e) {
        var menu = document.getElementById("filter-group");
        e.preventDefault();
        e.stopPropagation();
        for(let i = 0; i < inputArray.length; i++){
          filterGroup.appendChild(inputArray[i]);
          filterGroup.appendChild(labelArray[i]);
        }
        if (menuVisible){
          menu.style.display = "none";
          menuVisible = false;
        } else {
          menu.style.display = "block";
          menuVisible = true;
        }
      }, false);

    });


// ----------------------------------------------------

    markersGeoJson.features.forEach((marker) => {

      const popup = new mapboxgl.Popup().setHTML(marker.properties.infoWindow);

      // Create a HTML element for your custom marker
      const styleDefaultMarker = (element) => {
        element.className = 'test';
        // element.style.backgroundSize = 'contain';
        element.style.width = '15px';
        element.style.height = '15px';
        //element.style.boxShadow = "0px 0px 3px 1px white";
        element.style.borderRadius = "100px";
        //element.style.border ="1px solid white";
        // element.style.backgroundColor = "#4d4d4d";
        element.style.position = "absolute";
        element.style.opacity = "0";
      }

      const element = document.createElement('div');
      styleDefaultMarker(element)

      new mapboxgl.Marker(element)
      .setLngLat([ marker.geometry.coordinates[0], marker.geometry.coordinates[1] ])
      .setPopup(popup)
      .addTo(map);

      element.addEventListener('click', function (e) {

        // map.flyTo({center: [ marker.lng, marker.lat ], zoom: 13});
        map.flyTo({center: [ marker.geometry.coordinates[0], marker.geometry.coordinates[1] ], zoom: 13});
        element.style.opacity = "1";
        element.style.width = '20px';
        element.style.height = '20px';
        element.style.boxShadow = "0px 0px 20px 4px white";
        element.style.border ="3px solid white";
        element.style.backgroundImage = `url('dot-white.png')`;
        element.style.backgroundColor = "white";
        element.style.position = "absolute";

        let markersElements = document.querySelectorAll('.test')
        markersElements.forEach(marker => {
          if (marker !== element) {
            styleDefaultMarker(marker)
          }
        } )
      });

    });

    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
    fitMapToMarkers(map, markersGeoJson);

  }
};

export { initMapbox };

