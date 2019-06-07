const siteElement = document.querySelector('#distance_site');
console.log(siteElement);

const calculDistanceSite = (marker, geoloc) => {
  console.log(marker)
    const lat1 = geoloc.latitude*2*3.14/360
    const lon1 = geoloc.longitude*2*3.14/360
    const lat2 = marker.lat*2*3.14/360
    const lon2 = marker.long*2*3.14/360
    return Math.acos(Math.sin(lat1)*Math.sin(lat2)+Math.cos(lat1)*Math.cos(lat2)*Math.cos(lon2-lon1))*6371;
}

 const displaySite = (distance) => {
  if (siteElement) {
     siteElement.innerHTML = `<i class="fas fa-car"></i> <h6>${Math.trunc(distance)} km</h6>`;
    }
  };
const initDistanceSite = () => {
  if (siteElement) {
    const site_loc = JSON.parse(siteElement.dataset.site);
    navigator.geolocation.getCurrentPosition((data) => {
      console.log("siteElement")
      const geoloc = data.coords
      const distance = calculDistanceSite(site_loc, geoloc)
      displaySite(distance)
    });
  }
};
export { initDistanceSite };
