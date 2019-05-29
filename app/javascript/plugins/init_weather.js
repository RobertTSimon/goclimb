


const url = 'https://api.openweathermap.org/data/2.5/weather?lat=10,0&lon=26,2&appid=4969f88bf4001da7a381b09a81cb5ac5'



// Write in HTML
// const display = (name, temp, description, now, icon) => {
//   card.innerHTML = `
//     <h2>Weather in ${name}</h2>
//     <h4>${now}</h4>
//     <p>${description}</p>
//     <div class="weather">
//       <img src='http://openweathermap.org/img/w/${icon}.png' alt='icon'>
//       <h5>${temp}ºC</h5>
//     </div>
//   `;
// };
// Get the data from the url
const fetchWeatherByCoordinates = (url) => {
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      const date = new Date();
      const options = {
        weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric'
      };
      const now = date.toLocaleDateString('EN-EN', options);
      const name = data.list[0].name;
      const temp = data.list[0].main.temp;
      const icon = data.list[0].weather[0].icon;
      const description = data.list[0].weather[0].description;
      display(name, temp, description, now, icon);
    });
};
// Push the url when the event click happen.

fetchWeatherByCoordinates(url);

export { fetchWeatherByCoordinates };

