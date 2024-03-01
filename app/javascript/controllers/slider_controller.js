import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ["sleep", "exercise"]

  connect() {

  }

  update(event) {
    this.sleepTarget.innerText = `${event.currentTarget.value} hours a day`
  }
  exerciseupdate(event) {
  this.exerciseTarget.innerText = `${event.currentTarget.value} times a week`
}
}
