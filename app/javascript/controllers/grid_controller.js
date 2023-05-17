import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  

  multiple(event) {
    let grid = document.getElementById("posts-grid");
    if (!grid) return;
    grid.classList.remove("helcaraxe");
    grid.classList.add("utumno");
    this.element.children[0].classList.remove("active");
    this.element.children[1].classList.add("active");
  }

  one_per_line(event) {
    let grid = document.getElementById("posts-grid");
    if (!grid) return;
    grid.classList.remove("utumno");
    grid.classList.add("helcaraxe");
    this.element.children[1].classList.remove("active");
    this.element.children[0].classList.add("active");
  }
}

