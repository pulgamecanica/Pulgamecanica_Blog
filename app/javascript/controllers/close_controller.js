import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  closeAnimation() {
    this.element.style.display = "none";
    let closeAnimation = document.getElementById("closeAnimationsDialog");
    if (closeAnimation != undefined) {
      closeAnimation.style.display = "none";
    }
  };
}
