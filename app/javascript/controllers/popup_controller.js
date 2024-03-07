import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  connect() {
    console.log("connected")
    const popup = localStorage.getItem("popup")
    if (popup) document.querySelector(".popup").style.display = "block"
  }

  close(event) {
    event.currentTarget.parentElement.remove()
    localStorage.setItem("popup", true)
  }
}
