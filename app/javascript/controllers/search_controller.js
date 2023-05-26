import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  initializeSearch(event) {
    event.stopPropagation();
    this.element.style.display = "none";
    let input = document.getElementById("search-input");
    input.style.display = "block";
    input.focus();
  };
  hide(event) {
    console.log("hide");
    let input = document.getElementById("search-input");
    let icon = document.getElementById("search-controller");
    input.style.display = "none";
    icon.style.display = "block";
  };
}
