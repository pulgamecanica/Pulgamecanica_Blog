import { Controller } from "@hotwired/stimulus"

let previewVisible = false;
export default class extends Controller {
  showPreview() {
    let editable = document.getElementById("markdown-editable");
    let preview = document.getElementById("markdown-preview");

    editable.style.display = "none";
    preview.style.display = "block";
  }

  hidePreview() {
    let editable = document.getElementById("markdown-editable");
    let preview = document.getElementById("markdown-preview");

    editable.style.display = "block";
    preview.style.display = "none";
  }

  togglePreview() {
    console.log(previewVisible);
    if (previewVisible) {
      this.hidePreview();
    } else {
      this.showPreview();
    }
    previewVisible = !previewVisible;
  };
}
