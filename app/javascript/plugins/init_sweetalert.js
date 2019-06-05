import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector('#validate-trip');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', (event) => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};
export { initSweetalert };

// , (willConfirm) => {
//   if (willConfirm) {
//     // swal("Bam, Your booking has been created!", {
//     //   icon: "success",
//     // }).then(() => {
//       const form = document.getElementById('new_trip');
//       form.submit()
//    // });
//   } else {
//     swal("Your trip was not saved!");
//   }
// });
