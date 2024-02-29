import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]
  static values = {
    user: String
  }

  connect() {
  }

  select(event) {
    const selected = event.target
    const part = selected.parentElement.getAttribute("value")
    const url = `edit?category=${part}`;
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.formTarget.outerHTML = data
      })
}
}
