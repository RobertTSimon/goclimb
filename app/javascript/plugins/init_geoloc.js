
const geoElement = document.getElementById('map');

const initGeoloc = () => {
  if (geoElement) {
    navigator.geolocation.getCurrentPosition((data) => {
    });
  }
};

export { initGeoloc };
