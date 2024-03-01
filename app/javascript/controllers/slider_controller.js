import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ["number"]

  connect() {

  }

  update(event) {
    this.numberTarget.innerText = event.currentTarget.value
    // this.exerciseTarget.innerText = event.currentTarget.value
  }
}
