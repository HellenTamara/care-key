import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  static targets = ["coin50", "coin20"]

  connect() {
    console.log("connected");
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
        console.log("before ajax", this.coin50Target);
        document.querySelector(".goals-container").innerHTML = data.html
        console.log(data);
        console.log(data.score);
        console.log("after ajax", this.coin50Target);
          // this.element.innerHTML = data
        if (data.score == 50) {
          console.log("50 animate", this.coin50Target);
          setTimeout(() => {
            this.coin50Target.classList.toggle("hide");
            }, 2000);
            this.coin50Target.classList.toggle("hide");
        }

        if (data.score == 20) {
          console.log("20 animate", this.coin20Target);
          setTimeout(() => {
            this.coin20Target.classList.toggle("hide");
            }, 2000);
            this.coin20Target.classList.toggle("hide");
        }
        })

  }
}
