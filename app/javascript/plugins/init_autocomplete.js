import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('location-user');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
