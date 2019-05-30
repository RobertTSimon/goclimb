import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initGeoloc } from '../plugins/init_geoloc';
import { initWeather } from '../plugins/init_weather';
import { initDistance } from '../plugins/init_distance';

initMapbox();
initGeoloc();
initWeather();
initDistance();
