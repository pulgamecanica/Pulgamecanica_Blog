import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['togglePublishButton'];

  updateToggleButton() {
    let value = document.getElementById("page_published").checked
    if (value) {
      this.togglePublishButtonTarget.classList.remove("btn-primary");
      this.togglePublishButtonTarget.classList.add("btn-secondary");
      this.togglePublishButtonTarget.textContent = "Unpublish";
    } else {
      this.togglePublishButtonTarget.classList.remove("btn-secondary");
      this.togglePublishButtonTarget.classList.add("btn-primary");
      this.togglePublishButtonTarget.textContent = "Publish";
    }
  }

  connect() {
    this.updateToggleButton();
  }

  togglePublishButton() {
    document.getElementById("page_published").checked = !document.getElementById("page_published").checked;
    this.updateToggleButton();
  }

}

