const mapElement = document.getElementById('map');
const routeElement = document.getElementById('distance');

console.log(routeElement)

const calculDistance = (marker, geoloc) => {
    const lat1 = geoloc.latitude*2*3.14/360
    const lon1 = geoloc.longitude*2*3.14/360
    const lat2 = marker.lat*2*3.14/360
    const lon2 = marker.lng*2*3.14/360
    return Math.acos(Math.sin(lat1)*Math.sin(lat2)+Math.cos(lat1)*Math.cos(lat2)*Math.cos(lon2-lon1))*6371;
}

 const display = (distance) => {
  if (routeElement) {
     routeElement.innerHTML = routeElement.innerHTML + `<p><strong>Distance:</strong> ${Math.trunc(distance)} km</p>`;
    }
  };


const initDistance = () => {
  if (routeElement) {
    navigator.geolocation.getCurrentPosition((data) => {
      console.log("fetched geo loc of browser")
      console.log(data)
      const geoloc = data.coords
      const markers = JSON.parse(mapElement.dataset.markers);
      const markers_distances = markers.map((marker) => {
        const distance = calculDistance(marker, geoloc)
        marker.distance = distance;
        display(distance)
      });
    });
  }
};

export { initDistance };
