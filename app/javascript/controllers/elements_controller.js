import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  dragover(event) {
    event.preventDefault()
    return true
  }

  sort() {
    // alert("DROPED!");
    let element = document.getElementById('elements')
    let element_items = Array.from(document.getElementsByClassName('element-item'))
    let elements = element_items.map((element, index) => {
      return { id: element.dataset.id, position: index + 1 }
    })
    if (element)
    {
      element.dataset.elements = JSON.stringify(elements);
      let data = element.dataset.elements;
      // console.log(data); // HERE YOU NEED TO CALL THE CONTROLLER TO REORDER THE ELEMENTS :D
      // console.log(JSON.parse(data));
      fetch("sort_elements", {
        method: "POST", 
        headers: {
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
        },
        body: data,
      })
      .then((response) => response.json())
      .then((data) => {
        console.log("Success:", data);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
      // this.stimulate('ElementsReflex#sort', element)
    }
  }
}


// fetch("http://localhost:3000/users", {
//    method: 'POST',
//    headers: {
//       'Content-Type': 'application/json',
//    },
//    body: JSON.stringify({
//       first_name: userFirstName,
//       last_name: userLastName,
//       age: userAge
//    })
// })
//FIRST POSITION //
/* 
  [
    {"id":"24","position":1},

    {"id":"23","position":2},

    {"id":"26","position":3},

    {"id":"27","position":4},

    {"id":"28","position":5},

    {"id":"29","position":6}
  ]
*/
// SECOND POSITION //
/*
  [
    {"id":"23","position":1},

    {"id":"24","position":2},

    {"id":"26","position":3},

    {"id":"27","position":4},

    {"id":"28","position":5},

    {"id":"29","position":6}
  ]
*/