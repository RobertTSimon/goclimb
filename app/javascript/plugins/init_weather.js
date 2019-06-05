const weatherElement = document.querySelector('#weather')
import capitalize from 'capitalize'

 const display = (name, temp, description, icon) => {
  if (weatherElement) {
     weatherElement.innerHTML = `
       <div class="weather">
         <h6><img src='http://openweathermap.org/img/w/${icon}.png' alt='icon'> ${capitalize.words(description)} , ${temp} ºC</h6>
       </div> 
     `;
    }
  };
// Get the data from the url


const fetchWeatherByCoordinates = (url) => {
  if (weatherElement) {
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        const date = new Date();
        const options = {
          weekday: 'long', month: 'long', day: 'numeric'
        };
        const now = date.toLocaleDateString('EN-EN', options);
        const name = data.name;
        const temp = data.main.temp;
        const icon = data.weather[0].icon;
        const description = data.weather[0].description;
        display(name, temp, description, icon);
      });
  }
};
// Push the url when the event click happen.

const initWeather = () => {
  if (weatherElement) {
    const markers = JSON.parse(weatherElement.dataset.markers);
    const lat = markers[0].lat
    const lng = markers[0].lng
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&units=metric&appid=4969f88bf4001da7a381b09a81cb5ac5`
    fetchWeatherByCoordinates(url)
  }
}



export { initWeather };

