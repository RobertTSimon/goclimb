import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initGeoloc } from '../plugins/init_geoloc';
import { initWeather } from '../plugins/init_weather';
import { initDistance } from '../plugins/init_distance';
import { initDistanceSite } from '../plugins/init_distance_site';
import { initAutocomplete} from '../plugins/init_autocomplete';


initMapbox();
initGeoloc();
initWeather();
initDistance();
initDistanceSite();
initAutocomplete();
