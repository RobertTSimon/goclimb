
const geoElement = document.getElementById('map');

const initGeoloc = () => {
  if (geoElement) {
    navigator.geolocation.getCurrentPosition((data) => {
      console.log(data.coords);
    });
  }
};

export { initGeoloc };
