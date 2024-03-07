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
      headers: { "Accept": "application/json" },
      body: new FormData(form)
    })
      .then(response => response.json())
      .then((data) => {

        // if (data.inserted_item) {
        //   // beforeend could also be dynamic with Stimulus values
        //   form.insertAdjacentHTML("beforeend", data.inserted_item)
        // }

        this.element.innerHTML = data.html

        // if (data.score == 50) {
        //   setTimeout(() => {
        //     this.coin50Target.classList.toggle("hide");
        //   }, 2000);
        //   this.coin50Target.classList.toggle("hide");
        // }

        // if (data.score == 20) {
        //   setTimeout(() => {
        //     coin20.classList.toggle("hide");
        //   }, 2000);
        //   coin20.classList.toggle("hide");
        // }
      })
  }
}
