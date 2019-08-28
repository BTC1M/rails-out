import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
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
      style: 'mapbox://styles/mapbox/dark-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    const markersGeoJson = JSON.parse(mapElement.dataset.markersgeojson);

    // console.log(markers);
    // console.log(markersGeoJson);

// ----------------------------------------------------

    map.on('load', function() {
      // Add a GeoJSON source containing place coordinates and information.
      map.addSource("places", {
        "type": "geojson",
        "data": markersGeoJson
      });

      markersGeoJson.features.forEach(function(feature) {
        var symbol = feature.properties.icon['icone'];
        var category = feature.properties['category'];
        var layerID = 'poi-' + category;

        // Add a layer for this symbol type if it hasn't been added already.
        if (!map.getLayer(layerID)) {
          map.addLayer({
            "id": layerID,
            "type": "symbol",
            "source": "places",
            "layout": {
              "icon-image": symbol + "-15",
              "icon-allow-overlap": true
            },
            "filter": ["==", "category", category]
          });

          // Add checkbox and label elements for the layer.
          var input = document.createElement('input');
          input.type = 'checkbox';
          input.id = layerID;
          input.checked = true;
          filterGroup.appendChild(input);

          var label = document.createElement('label');
          label.setAttribute('for', layerID);
          label.textContent = category;
          filterGroup.appendChild(label);

          // When the checkbox changes, update the visibility of the layer.
          input.addEventListener('change', function(e) {
            map.setLayoutProperty(layerID, 'visibility',
              e.target.checked ? 'visible' : 'none');
          });
        }
      });
    });

// ----------------------------------------------------

    // // markers.forEach((marker) => {
    // markersGeoJson.features.forEach((marker) => {

      // // const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      // const popup = new mapboxgl.Popup().setHTML(marker.properties.infoWindow);

      // // Create a HTML element for your custom marker
      // const styleDefaultMarker = (element) => {
      //   element.className = 'my-icon';
      //   element.style.backgroundSize = 'contain';
      //   element.style.width = '15px';
      //   element.style.height = '15px';
      //   element.style.boxShadow = "0px 0px 12px 1px white";
      //   element.style.borderRadius = "100px";
      //   element.style.border ="1px solid white";
      //   element.style.backgroundColor = "#4d4d4d";
      //   element.style.position = "absolute";
      //   // element.style.backgroundImage = `url('${marker.image_url}')`;
      //   // element.style.backgroundImage = `url('${marker.properties.image_url}')`;
      // }

      // const element = document.createElement('div');
      // styleDefaultMarker(element)

      // new mapboxgl.Marker(element)
      // // .setLngLat([ marker.lng, marker.lat ])
      // .setLngLat([ marker.geometry.coordinates[0], marker.geometry.coordinates[1] ])
      // .setPopup(popup)
      // .addTo(map);

      // element.addEventListener('click', function (e) {

      //   // map.flyTo({center: [ marker.lng, marker.lat ], zoom: 13});
      //   map.flyTo({center: [ marker.geometry.coordinates[0], marker.geometry.coordinates[1] ], zoom: 13});
      //   element.style.width = '20px';
      //   element.style.height = '20px';
      //   element.style.boxShadow = "0px 0px 20px 4px white";
      //   element.style.border ="3px solid white";
      //   element.style.backgroundImage = `url('dot-white.png')`;
      //   element.style.backgroundColor = "white";
      //   element.style.position = "absolute";

      //   let markersElements = document.querySelectorAll('.marker')
      //   markersElements.forEach(marker => {
      //     if (marker !== element) {
      //       styleDefaultMarker(marker)
      //     }
      //   } )
      // });

    // });

    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
    fitMapToMarkers(map, markers);
    // fitMapToMarkers(map, markersGeoJson);

  }
};

export { initMapbox };


// --------------------------------------------


// const zoomMapbox = () => {
  // marker.addEventListener('click', e => map.flyTo(e.latlng, 15))
  // map.on('click', 'symbols', function (e) {
  //       map.flyTo({center: e.features[0].geometry.coordinates});
// }

//           const zoomMapbox = () => {
// marker.on('click', function(e){
//   map.setView(e.latlng, 15);


// const mapElement = document.getElementById('map');

// const buildMap = () => {
//   mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//   return new mapboxgl.Map({
//     container: 'map',
//     style: 'mapbox://styles/mapbox/dark-v10'
//   });
// };

// const addMarkersToMap = (map, markers) => {
//   markers.forEach((marker) => {
//     const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

//     new mapboxgl.Marker()
//       .setLngLat([ marker.lng, marker.lat ])
//       .setPopup(popup) // add this
//       .addTo(map);
//   });
// };

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
// };

// const initMapbox = () => {
//   if (mapElement) {
//     const map = buildMap();
//     const markers = JSON.parse(mapElement.dataset.markers);
//     addMarkersToMap(map, markers);
//     fitMapToMarkers(map, markers);
//   }
// };



// export { initMapbox };

