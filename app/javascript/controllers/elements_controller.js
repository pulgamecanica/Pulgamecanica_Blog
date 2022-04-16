import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    let element = document.getElementById('elements')
    let element_items = Array.from(document.getElementsByClassName('element-item'))
    let elements = element_items.map((element, index) => {
      return { id: element.dataset.id, position: index + 1 }
    })
    if (element)
    {
      element.dataset.elements = JSON.stringify(elements)
      // console.log(JSON.stringify(elements));
      // this.stimulate('ElementsReflex#sort', element)
    }
  }
}
