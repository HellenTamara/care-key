import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["photo", "bubble"]
  static values = {
    goal: String,
    url: String
  }

  connect() {
    if (this.urlValue !== "") {
      const original = this.photoTarget.src

      this.setSrc(this.photoTarget, this.urlValue);
      setTimeout(this.setSrc, 2000, this.photoTarget, original);

    }
  }

  setSrc(element, url){
    console.log(url)
    element.src = url
  }

  avatar() {
    setTimeout(() => {
      const part = this.bubbleTarget.classList.toggle("hide");
      }, 3000);
      const part = this.bubbleTarget.classList.toggle("hide");
  }
}
