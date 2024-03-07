import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  static targets = ["coin20", "coin50"]

  connect() {
    console.log("connected");
    const coin20 = this.coin20Target
  }

  mark(event) {
    const form = event.currentTarget
    console.log(form)

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
          document.querySelector(".goals-container").innerHTML = data
          // this.element.innerHTML = data
        })

  }
}
