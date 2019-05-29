
const geoElement = document.getElementById('geo');


const initGeoloc = () => {
  if (geoElement) {
    navigator.geolocation.getCurrentPosition((data) => {
      console.log(data);
    });
  }
};

export { initGeoloc };
