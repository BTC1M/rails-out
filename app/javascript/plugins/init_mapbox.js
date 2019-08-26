import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/dark-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {

      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      // Create a HTML element for your custom marker

     const styleDefaultMarker = (element) => {
      element.className = 'marker';
      element.style.backgroundSize = 'contain';
      element.style.width = '15px';
      element.style.height = '15px';
      element.style.boxShadow = "0px 0px 12px 1px white";
      element.style.borderRadius = "100px";
      element.style.border ="1px solid white";
      element.style.backgroundColor = "#4d4d4d";
              element.style.position = "absolute";

      element.style.backgroundImage = `url('${marker.image_url}')`;
      }

      const element = document.createElement('div');
      styleDefaultMarker(element)


      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);


      
        element.addEventListener('click', function (e) {

        map.flyTo({center: [ marker.lng, marker.lat ], zoom: 13});
        element.style.width = '20px';
        element.style.height = '20px';
        element.style.boxShadow = "0px 0px 20px 4px white";
        element.style.border ="3px solid white";
        element.style.backgroundImage = `url('dot-white.png')`;
        element.style.backgroundColor = "white";
        element.style.position = "absolute";

        let markersElements = document.querySelectorAll('.marker') 
        markersElements.forEach(marker => {
          if (marker !== element) {
            styleDefaultMarker(marker)
          }
        } )
      });




      // const zoomMapbox = () => {
        // marker.addEventListener('click', e => map.flyTo(e.latlng, 15))
        // map.on('click', 'symbols', function (e) {
        //       map.flyTo({center: e.features[0].geometry.coordinates});
      // } 
    });


    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };


// --------------------------------------------


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

