import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static targets = ["form"]
  static targets = ["bubble"]
  static values = {
    url: String
  }

  connect() {
    if (this.urlValue !== "") {
      setTimeout(() => {
      const part = this.bubbleTarget.classList.toggle("hide");
      }, 2000);
      const part = this.bubbleTarget.classList.toggle("hide");
    }
  }
}
