import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  connect() {
    console.log("connected");
  }

  mark(event) {
    const form = event.currentTarget

      fetch(form.action, {
        method: "POST",
        headers: { "Accept": "text/plain" },
        body: new FormData(form)
      })
        .then(response => response.text())
        .then((data) => {
          // if (data.inserted_item) {
          //   // beforeend could also be dynamic with Stimulus values
          //   form.insertAdjacentHTML("beforeend", data.inserted_item)
          // }
          this.element.innerHTML = data
        })
  }
}
