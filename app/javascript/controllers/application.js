import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


import Sortable from 'sortablejs';

document.addEventListener('turbo:load', () => {

  var prevScrollpos = window.pageYOffset;
  window.onscroll = function() {
  var currentScrollPos = window.pageYOffset;
    if (prevScrollpos > currentScrollPos) {
      document.getElementById("main-nav-bar").style.top = "0";
    } else {
      document.getElementById("main-nav-bar").style.top = "-100px";
    }
    prevScrollpos = currentScrollPos;
  }

  document.addEventListener('click', () => {
    let element = event.target.closest('.paragraph-content')
    if (!element) return;

    element.classList.add('d-none')
    element.nextElementSibling.classList.remove('d-none')
  })

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
})





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
