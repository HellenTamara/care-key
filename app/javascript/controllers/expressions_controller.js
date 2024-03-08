import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["photo", "coin50", "bubble"]

  static values = {
    goal: String,
    url: String,
    status: String
  }

  connect() {
    if (this.urlValue !== "") {
      const original = this.photoTarget.src

      this.setSrc(this.photoTarget, this.urlValue);
      setTimeout(this.setSrc, 2000, this.photoTarget, original);

    }

    if (this.statusValue == "true") {
      setTimeout(() => {
      this.coin50Target.classList.toggle("hide");
      }, 2000);
      this.coin50Target.classList.toggle("hide");
    }
  }

  setSrc(element, url){
    console.log(url)
    element.src = url
  }

  avatar() {
    setTimeout(() => {
      const part = this.bubbleTarget.classList.toggle("hide");
      }, 2000);
      const part = this.bubbleTarget.classList.toggle("hide");
  }
}
