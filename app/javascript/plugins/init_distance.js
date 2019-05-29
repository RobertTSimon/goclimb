
const mapElement = document.getElementById('map');

const routeElement = document.querySelector('.card-route-index-info');


const calculDistance = (marker, geoloc) => {
    const lat1 = geoloc.latitude
    const lon1 = geoloc.longitude
    const lat2 = marker.lat
    const lon2 = marker.lng
    return Math.acos(Math.sin(lat1)*Math.sin(lat2)+Math.cos(lat1)*Math.cos(lat2)*Math.cos(lon2-lon1))*6371;
}



 const display = (distance) => {
  if (routeElement) {
     routeElement.innerHTML = routeElement.innerHTML + `<p>distance :${distance}</p>`;
    }
  };


const initDistance = () => {
  if (mapElement) {
    navigator.geolocation.getCurrentPosition((data) => {
      const geoloc = data.coords
      console.log(data.coords);
      const markers = JSON.parse(mapElement.dataset.markers);
      const markers_distances = markers.map((marker) => {
        const distance = calculDistance(marker, geoloc)
        marker.distance = distance;
        console.log(marker)
        console.log(distance)
        display(distance)
      });
    });
  }
};






export { initDistance };
