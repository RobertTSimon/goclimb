const weatherElement = document.querySelector('#weather')


 const display = (name, temp, description, now, icon) => {
  if (weatherElement) {
     weatherElement.innerHTML = `
       <h2>Weather in ${name}</h2>
       <h4>${now}</h4>
       <p>${description}</p>
       <div class="weather">
         <img src='http://openweathermap.org/img/w/${icon}.png' alt='icon'>
         <h5>${temp}ºC</h5>
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
          weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric'
        };
        const now = date.toLocaleDateString('EN-EN', options);
        const name = data.name;
        const temp = data.main.temp;
        const icon = data.weather[0].icon;
        const description = data.weather[0].description;
        display(name, temp, description, now, icon);
      });
  }
};
// Push the url when the event click happen.

const initWeather = () => {
  const markers = JSON.parse(weatherElement.dataset.markers);
  console.log(markers)
  const lat = markers[0].lat
  const lng = markers[0].lng
  console.log(lat)
  console.log(lng)
  const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&units=metric&appid=4969f88bf4001da7a381b09a81cb5ac5`
  fetchWeatherByCoordinates(url)
}


export { initWeather };
