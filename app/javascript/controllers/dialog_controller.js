import { Controller } from "@hotwired/stimulus"

/**
 * Dialog Usage:
 *  - controller = dialog
 *  - dataset = [data-dialog-name-id=<NameID>]
 *  - actions = showDialog hideDialog
 * 
 *  - HTML
 *  <*
 *    class="dialog"
 *    data-controller="dialog"
 *    data-dialog-name-id="showTags"
 *  >
 *    <*>
 *      ...Content Show, click this to display Dialog
 *    </*>
 *
 *    <*
 *      class="dialog-body"
 *      id="NameID"
 *    >
 *      Dialog Content, Body
 *    </*>
 *  </*>
 **/

export default class extends Controller {
  showDialog() {
    const id = this.element.dataset.dialogNameId;
    const element = document.getElementById(id)
    element.style.display = "flex";
    element.addEventListener('click', (event) => {
      let elementClosest = event.target.closest("div");
      console.log("Closest", elementClosest);
      if (elementClosest != element) return;
      element.style.display = "none";
    });
  }

  hideDialog() {
    const id = this.element.dataset.dialogNameId;
    const element = document.getElementById(id)
    element.style.display = "none";
  }
}
