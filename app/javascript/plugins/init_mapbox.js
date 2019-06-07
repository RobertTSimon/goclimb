import mapboxgl from 'mapbox-gl';
import "mapbox-gl/dist/mapbox-gl.css";
// import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.js'
// import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css'

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/cjaudgl840gn32rnrepcb9b9g'
  });
};

  // const direction = () => {
  //   const directions = new MapboxDirections({
  //     accessToken: mapElement.dataset.mapboxApiKey,
  //     unit: 'metric',
  //     profile: 'mapbox/walking',
  //     controls: {
  //     inputs: false,
  //     instructions: false,
  //     profileSwitcher: false
  //     },
  //     flyTo: false
  //    });
  //   directions.setOrigin([37.6173, 55.7558])
  //   directions.setDestination([pharmacyData[0].lng, pharmacyData[0].lat])
  //   map.addControl(directions);
  // };


const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    // console.log("popup null check")
    // console.log(marker.infowindow === undefined)
    // console.log(marker.infowindow)
    if (marker.infowindow === undefined) {
      const this_marker = new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
      setMarkerColor(this_marker, "#0cb25f")
    } else {
      const popup = new mapboxgl.Popup().setHTML(marker.infowindow); // add this

      const this_marker = new mapboxgl.Marker()
        .setPopup(popup) // add this
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
      setMarkerColor(this_marker, "#0cb25f")
    }

  });
};

function setMarkerColor(marker, color) {
    var $elem = jQuery(marker.getElement());
    $elem.find('svg g[fill="' + marker._color + '"]').attr('fill', color);
    marker._color = color;
}

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    const markers_trip = JSON.parse(mapElement.dataset.markers_trip);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers_trip);
  }
};

export { initMapbox };
