import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initGeoloc } from '../plugins/init_geoloc';
import { initWeather } from '../plugins/init_weather';
import { initDistance } from '../plugins/init_distance';
import { initDistanceSite } from '../plugins/init_distance_site';
import { initAutocomplete} from '../plugins/init_autocomplete';
import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#validate-trip', {
  title: "Are you sure you want to save this trip",
  text: "Your level will increase or decrease based on your success on trip!",
  icon: "success",
  buttons: true,
  dangerMode: false,
}, (value) => {
  if (value) {
    const link = document.querySelector('#save-link');
    link.click();
  }
});


initMapbox();
initGeoloc();
initWeather();
initDistance();
initDistanceSite();
initAutocomplete();
