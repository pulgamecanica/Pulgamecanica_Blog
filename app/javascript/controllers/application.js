import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


import Sortable from 'sortablejs';

document.addEventListener('turbo:load', () => {

  let prevScrollpos = window.pageYOffset;
  window.onscroll = function() {
    var currentScrollPos = window.pageYOffset;
    if(document.getElementById("main-nav-bar"))
    {
      if (prevScrollpos > currentScrollPos) {
        document.getElementById("main-nav-bar").style.top = "0";
      } else {
        document.getElementById("main-nav-bar").style.top = "-100px";
      }
      prevScrollpos = currentScrollPos;
    }
  }

  let themeButton = document.getElementById("theme-button");
  if (themeButton)
  {
    themeButton.addEventListener('click', () => {
      let sideBar = document.getElementById("side_bar");
      let silver = document.querySelectorAll(".arkenstone");
      let green = document.querySelectorAll(".elfstone");
      let red = document.querySelectorAll(".nauglamir");
      let dark = document.querySelectorAll(".silmaril");
      let pre = document.querySelectorAll("pre");
      if (themeButton.classList.contains("active"))
      {
        themeButton.classList.remove("active");
        document.body.classList.remove("bg-light");
        document.body.classList.add("bg-dark");
        sideBar.style.backgroundColor = "#212121";
        dark.forEach(function(elem) {elem.style.color = "#e0e0e0";});
        pre.forEach(function(elem) {elem.style.backgroundColor = "#424242";});
      }
      else {
        themeButton.classList.add("active");
        document.body.classList.add("bg-light");
        document.body.classList.remove("bg-dark");
        sideBar.style.backgroundColor = "#193747";
        dark.forEach(function(elem) {elem.style.color = "#383838";});
        pre.forEach(function(elem) {elem.style.backgroundColor = "#eee";});
      }
    })
  }

  document.addEventListener('click', () => {
    let element = event.target.closest('.paragraph-content')
    if (!element) return;

    element.classList.add('d-none')
    element.nextElementSibling.classList.remove('d-none')
  });

  document.addEventListener('click', () => {
    if (!event.target.matches('.cancel')) return;

    event.preventDefault();

    let element = event.target.closest('.paragraph-form')

    element.classList.add('d-none')
    element.previousElementSibling.classList.remove('d-none')
  })
  let sortable_elements = document.getElementById('elements')
  if (sortable_elements)
    Sortable.create(sortable_elements, { animation: 150 })
});







// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   sort() {
//     let element = document.getElementById('elements')
//     let element_items = Array.from(document.getElementsByClassName('element-item'))
//     let elements = element_items.map((element, index) => {
//       return { id: element.dataset.id, position: index + 1 }
//     })
//     element.dataset.elements = JSON.stringify(elements)
//     this.stimulate('ElementsReflex#sort', element)
//   }
// }
