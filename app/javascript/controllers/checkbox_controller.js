import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["checkbox"];

  connect() {
    console.log("test")
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.addEventListener("change", this.submitForm.bind(this));
    });
  }

  submitForm(event) {
    if (event.target.checked) {
      event.target.closest("form").submit();
    }
  }
}
